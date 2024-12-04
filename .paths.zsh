[ -e "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

d="$HOME/.go"; [[ -d "$d" ]] && export GOPATH="$d"
d="$HOME/opt/android-sdk-r21"; [[ -d "$d" ]] && export ANDROID_HOME="$d"
d="$HOME/.perl5/lib/perl5"; [[ -d "$d" ]] && export PERL5LIB="$d"
d="$HOME/.perl5"; [[ -d "$d" ]] && ! [[ "$PERL_LOCAL_LIB_ROOT" =~ "$d" ]] && export PERL_LOCAL_LIB_ROOT="$d:$PERL5LIB"
d="--install_base \"$HOME/.perl5\""; [[ -d "$d" ]] && export PERL_MB_OPT="$d"
d="INSTALL_BASE=$HOME/.perl5"; [[ -d "$d" ]] && export PERL_MM_OPT="$d"
d="$HOME/.local/share/rbenv"; [[ -d "$d" ]] && export RBENV_ROOT="$d"

export_paths=(
  "$HOME/opt/JLink_Linux"
  "$HOME/opt/android-sdk-r21/tools"
  "$HOME/opt/android-sdk-r21/platform-tools"
  "$HOME/opt/android-sdk-r21/build-tools/android-4.4.2"
  "$HOME/opt/android-sdk-r21/android-ndk-r8e"
  "$HOME/altera_lite/16.0/quartus/bin/"
  "$HOME/opt/altera_lite/16.0/quartus/bin"
  "$HOME/opt/altera_lite/16.0/modelsim_ase/bin"
  "$HOME/.local/bin"
  "$HOME/.gem/ruby/2.5.0/bin"
  "$HOME/.luarocks/bin"
  "$HOME/.perl5/bin"
  "$RBENV_ROOT/bin/"
  "$GOPATH/bin/"
)

for value in "${export_paths[@]}"; do
  [[ -d "$value" ]] && [[ ! "$PATH" =~ "$value" ]] && export PATH="$value:$PATH"
done

if [ -d "$HOME/opt" ]; then
  for dir in $(find "$HOME/opt" -maxdepth 1 -type d); do
    [[ -d "$dir/bin" ]] && ! [[ "$PATH" =~ "$dir/bin" ]] && export PATH="$dir/bin:$PATH"
    [[ -d "$dir/usr/bin" ]] && ! [[ "$PATH" =~ "$dir/usr/bin" ]] && export PATH="$dir/usr/bin:$PATH"
    [[ -d "$dir/share/man" ]] && ! [[ "$MANPATH" =~ "$dir/share/man" ]] && export MANPATH="$dir/share/man:$PATH"
  done
fi

