#!/usr/bin/perl
#
# Dzen2 popup calendar
# Perl Script
# Distributed under Public Domain License
# 
# TODO Show last days of prev month
# TODO Switching between months
#

use strict;
use warnings;
use constant {
	CL_LIGHT	=> "#85F9C9",
	CL_MID		=> "#778899",
	CL_DARK		=> "#262626",
};

sub dz_putline {
	my $la = "^pa(5)$_[0]^pa(25)$_[1]^pa(45)$_[2]^pa(65)$_[3]^pa(85)$_[4]^pa(105)$_[5]^pa(125)$_[6]";
	return $la;
}

my $dz_args; # Dzen2 arguments var
my $dz_content; # Dzen2 display content var

my $dz_width = 147; # Dzen2 window width
my $dz_height = 19; # Every line height
my $dz_mouse = `xdotool getmouselocation --shell`;
my ($dz_x) = $dz_mouse =~ /X=(\d+)\n/;
$dz_x -= $dz_width+5;
my $dz_y = 28;

# (w - ((d-1) % 7))
my @wmdy = (`date '+%w %m %d %y'` =~ /([\w]+)\s/g); # week month day year array
my $day1index = $wmdy[0]-(($wmdy[2]-1)%7);
$day1index = $day1index != 0 ? $day1index : 7;

my $month_len;
if ($wmdy[1] == 1) { $month_len = 31 }
elsif ($wmdy[1] == 2) { 
	if (($wmdy[3]%4 == 0 && $wmdy[3]%100 != 0) || $wmdy[3]%400 == 0) {
		$month_len = 29; # Leap year february
	} else {
		$month_len = 28;
	}
}
elsif ($wmdy[1] == 3) { $month_len = 31 }
elsif ($wmdy[1] == 4) { $month_len = 30 }
elsif ($wmdy[1] == 5) { $month_len = 31 }
elsif ($wmdy[1] == 6) { $month_len = 30 }
elsif ($wmdy[1] == 7) { $month_len = 31 }
elsif ($wmdy[1] == 8) { $month_len = 31 }
elsif ($wmdy[1] == 9) { $month_len = 30 }
elsif ($wmdy[1] == 10) { $month_len = 30 }
elsif ($wmdy[1] == 11) { $month_len = 30 }
elsif ($wmdy[1] == 12) { $month_len = 31 }

my @dz_line;
for my $i (1..$month_len) {
	if ($i == $wmdy[2] && $wmdy[1] == `date '+%m'`) {
		$dz_line[$day1index-1+$i-1] = "^bg(".CL_LIGHT.")^fg(".CL_DARK.")$i";
	} else {
		$dz_line[$day1index-1+$i-1] = "^bg(".CL_DARK.")^fg(".CL_LIGHT.")$i";
	}
}
for my $i (0..$day1index-2) {
	$dz_line[$i] = "^fg(".CL_MID.") ";
}
for my $i (1..100) {
	$dz_line[$i-1+$month_len+$day1index-1] = "^fg(".CL_MID.") ";
}
my $lines = ($day1index-1+$month_len)/7; # Calendar lines count
$lines += ($day1index-1+$month_len)%7 == 0 ? 0 : 1;
$dz_content .= "^pa(5)^ca(1, ./r.sh)".`date '+%d %b %Y %a'`."^ca()";
$dz_content .= "^fg(".CL_MID.")^pa(5)M^pa(25)T^pa(45)W^pa(65)T^pa(85)F^pa(105)S^pa(125)S\n";
for my $i (0..$lines-1) {
	$dz_content .= dz_putline(@dz_line[7*$i..7*$i+6]);
	if ($i < $lines-2) {
		$dz_content .= "\n";
	}
}

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
