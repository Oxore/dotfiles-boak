#!/usr/bin/perl
#
# Dzen2 popup calendar
# Perl Script
# Distributed under Public Domain License
# Deps: xdotool
# 
# TODO Show last days of prev month
# TODO Switching between months
#

use strict;
use warnings;
use constant {
	CL_LIGHT	=> "#85F9C9",	#
	CL_MID		=> "#778899",	# Colors
	CL_DARK		=> "#262626",	#
	OFFS_1		=> 5,			# First column offset
	OFFS_D		=> 26,			# Column to column offset
};

my $dz_args; # Dzen2 arguments var
my $dz_content; # Dzen2 display content var
my $dz_width = 184; # Dzen2 window width
my $dz_height = 20; # Every line height
my $dz_mouse = `xdotool getmouselocation --shell`;
my ($dz_x) = $dz_mouse =~ /X=(\d+)\n/; # x position near mouse cursor 
$dz_x -= $dz_width+5;
my $dz_y = 28; # Offset from top of the screen


#
# Next line composition subroutine
#
sub compose_line {
	my (@arr) = @_;
	my $la = "^pa(".(OFFS_1+OFFS_D*0).")$arr[0]^pa(".(OFFS_1+OFFS_D*1).")$arr[1]^pa(".(OFFS_1+OFFS_D*2).")$arr[2]^pa(".(OFFS_1+OFFS_D*3).")$arr[3]^pa(".(OFFS_1+OFFS_D*4).")$arr[4]^pa(".(OFFS_1+OFFS_D*5).")$arr[5]^pa(".(OFFS_1+OFFS_D*6).")$arr[6]";
	return $la;
}


#
# Calculating first day in month position (week day)
# (w - ((d-1) % 7))
#
my @wmdy = (`date '+%w %m %d %y'` =~ /([\w]+)\s/g); # week month day year array
$wmdy[0] = $wmdy[0] != 0 ? $wmdy[0] : 7;
my $day1index = $wmdy[0]-(($wmdy[2]-1)%7);
$day1index += $day1index <= 0 ? 7 : 0;

#
# Calculating month length subroutine
#
sub mon_len {
	my (@args) = @_; #wmdy
	my $month = $args[1];
	my $year = $args[3];
	my $len;
	if ($month == 1) { $len = 31 }
	elsif ($month == 2) { 
		if (($year%4 == 0 && $year%100 != 0) || $year%400 == 0) {
			$len = 29; # Leap year february
		} else {
			$len = 28;
		}
	}
	elsif ($month == 3) { $len = 31 }
	elsif ($month == 4) { $len = 30 }
	elsif ($month == 5) { $len = 31 }
	elsif ($month == 6) { $len = 30 }
	elsif ($month == 7) { $len = 31 }
	elsif ($month == 8) { $len = 31 }
	elsif ($month == 9) { $len = 30 }
	elsif ($month == 10) { $len = 31 }
	elsif ($month == 11) { $len = 30 }
	elsif ($month == 12) { $len = 31 }
	return $len;
}
my $month_len = mon_len(@wmdy);


#
# Composing array of displayable month
#
my @cline;
for my $i (1..$month_len) {
	if ($i == $wmdy[2] && $wmdy[1] == `date '+%m'`) {
		$cline[$day1index-1+$i-1] .= "^bg(".CL_LIGHT.")^fg(".CL_DARK.")";
		$cline[$day1index-1+$i-1] .= $i <= 9 ? "  " : "";
		$cline[$day1index-1+$i-1] .= "$i";
	} else {
		$cline[$day1index-1+$i-1] .= "^bg(".CL_DARK.")^fg(".CL_LIGHT.")";
		$cline[$day1index-1+$i-1] .= $i <= 9 ? "  " : "";
		$cline[$day1index-1+$i-1] .= "$i";
	}
}
for my $i (0..$day1index-2) {
	$cline[$i] = "^fg(".CL_MID.") ";
}
for my $i (1..100) {
	$cline[$i-1+$month_len+$day1index-1] = "^bg(".CL_DARK.")^fg(".CL_MID.") ";
}
my $lines = ($day1index-1+$month_len)/7; # Calendar lines count
$lines += ($day1index-1+$month_len)%7 == 0 ? 0 : 1;


#
# Filling content
#
$dz_content .= "^pa(5)^ca(1, ./r.sh)".`date '+%d %b %Y %a'`."^ca()";
$dz_content .= "^fg(".CL_MID.")^pa(".(OFFS_1+OFFS_D*0).")Mo^pa(".(OFFS_1+OFFS_D*1).")Tu^pa(".(OFFS_1+OFFS_D*2).")We^pa(".(OFFS_1+OFFS_D*3).")Th^pa(".(OFFS_1+OFFS_D*4).")Fr^pa(".(OFFS_1+OFFS_D*5).")Sa^pa(".(OFFS_1+OFFS_D*6).")Su\n";
for my $i (0..$lines-1) {
	$dz_content .= compose_line(@cline[7*$i..7*$i+6]);
	if ($i < $lines-2) {
		$dz_content .= "\n";
	}
}


#
# Putting arguments
#
$lines += 1;
$dz_args .= "-ta l ";
$dz_args .= "-bg '".CL_DARK."' ";
$dz_args .= "-fg '".CL_LIGHT."' ";
$dz_args .= "-fn 'System San Francisco Display:size=10' ";
$dz_args .= "-p ";
$dz_args .= "-x $dz_x ";
$dz_args .= "-y $dz_y ";
$dz_args .= "-w $dz_width ";
$dz_args .= "-h $dz_height ";
$dz_args .= "-l $lines ";
$dz_args .= "-e 'onstart=uncollapse;button1=exit;button2=exit;button3=exit;button4=exit;button5=exit;leaveslave=exit' ";

system("echo \"$dz_content\" | dzen2 $dz_args");
