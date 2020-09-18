# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


export LOG_LEVEL=info

export MDU_BUP_DIRECTORY="$HOME/dev/prog/BUP"


LD_LIBRARY_PATH="${HOME}/dev/local/lib"
export LD_LIBRARY_PATH
C_INCLUDE_PATH="${HOME}/dev/local/include"
export C_INCLUDE_PATH

DESTDIR="${HOME}/dev/local"
export DESTDIR


# Set PATH so it includes user's private bin if it exists
# and is not already in the PATH
if [ -d "$HOME/bin" ] ; then
	FOUND=0
	echo ":$PATH:" | grep -q ":${HOME}/bin:" && FOUND=1
	echo ":$PATH:" | grep -q ":~/bin:" && FOUND=1
	test $FOUND -eq 0 && {
		PATH="$PATH:$HOME/bin"
		export PATH
	}
fi

vim_path="$(which vim)"
if [ "x$vim_path" != x ] ; then
	EDITOR=$vim_path
	export EDITOR
fi


# Source all 'profile' files in config dir
HOLDER_DIRECTORY="$HOME/.config/mdu/profile.d"
if [ -d "$HOLDER_DIRECTORY" ]; then
	for config_file in "$HOLDER_DIRECTORY"/* ; do
		test "x${config_file:0:1}" != "x." || continue
		test -f "${config_file}" -a -r "${config_file}" || continue
		. "${config_file}"
	done
fi


alias svim='sudo -E vim'

alias b='function _mdu_do_b(){ b "$@"; history -d $(($HISTCMD - 1)) ; unset -f _mdu_do_b ; }; _mdu_do_b'
alias b\?="b \?"

alias npm-exec='PATH=$(npm bin):$PATH'

