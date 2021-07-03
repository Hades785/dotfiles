# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add user scripts
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi

# Add adroid-sdk/platform-tools to $PATH
if [ -d "$HOME/android-sdk/platform-tools" ] ; then
    PATH="$PATH:$HOME/android-sdk/platform-tools"
fi

# Add Yarn to path
if [ -d "$HOME/.yarn" ] ; then
	PATH="$HOME/.yarn/bin:$PATH"
fi

# Add Deno to path
if [ -d "$HOME/.deno" ] ; then
	export DENO_INSTALL="$HOME/.deno"
	PATH="$DENO_INSTALL/bin:$PATH"
fi

# Add GHC to path
if [ -d "/opt/ghc/bin" ] ; then
	PATH="$PATH:/opt/ghc/bin"
fi

# Add Rust to path
if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

# Add Ruby gems to path
if [ -d "$HOME/.local/share/gem/ruby/2.7.0/bin" ] ; then
    PATH="$PATH:$HOME/.local/share/gem/ruby/2.7.0/bin"
fi

if [ -d "$HOME/Android/Sdk/build-tools/30.0.3" ] ; then
    PATH="$HOME/Android/Sdk/build-tools/30.0.3:$PATH"
    export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [[ -d "$HOME/.rvm/bin" ]]; then
    PATH="$PATH:$HOME/.rvm/bin"
fi

# Set $JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk/

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Config IM + launch ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# opencv log level (used by howdy: facial recog)
export OPENCV_LOG_LEVEL=ERROR

