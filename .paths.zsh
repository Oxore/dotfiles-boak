if [ -e "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

d="$HOME/.go"
if [[ -d "$d" ]] then
  export GOPATH="$d"
fi
d="$HOME/opt/android-sdk-r21"
if [[ -d "$d" ]]; then
  export ANDROID_HOME="$d"
fi
d="$HOME/.perl5/lib/perl5"
if [[ -d "$d" ]]; then
  export PERL5LIB="$d"
fi
d="$HOME/.perl5"
if [[ -d "$d" ]] && ! [[ "$PERL_LOCAL_LIB_ROOT" =~ "$d" ]]; then
  export PERL_LOCAL_LIB_ROOT="$d:$PERL5LIB"
fi
d="--install_base \"$HOME/.perl5\""
if [[ -d "$d" ]]; then
  export PERL_MB_OPT="$d"
fi
d="INSTALL_BASE=$HOME/.perl5"
if [[ -d "$d" ]]; then
  export PERL_MM_OPT="$d"
fi
d="$HOME/.local/share/rbenv"
if [[ -d "$d" ]]; then
  export RBENV_ROOT="$d"
fi
unset d

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
  if [[ -d "$value" ]] && [[ ! "$PATH" =~ "$value" ]]; then
    export PATH="$value:$PATH"
  fi
done
unset export_paths

if [ -d "$HOME/opt" ]; then
  for dir in $(find "$HOME/opt" -maxdepth 1 -type d); do
    if [[ -d "$dir/bin" ]] && ! [[ "$PATH" =~ "$dir/bin" ]]; then
      export PATH="$dir/bin:$PATH"
    fi
    if [[ -d "$dir/usr/bin" ]] && ! [[ "$PATH" =~ "$dir/usr/bin" ]]; then
      export PATH="$dir/usr/bin:$PATH"
    fi
    if [[ -d "$dir/share/man" ]] && ! [[ "$MANPATH" =~ "$dir/share/man" ]]; then
      export MANPATH="$dir/share/man:$PATH"
    fi
  done
fi
