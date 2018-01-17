{ config, pkgs, ... }:

{

  environment.interactiveShellInit = ''
    HISTCONTROL=ignoreboth

    shopt -s histappend

    shopt -s checkwinsize

    function search () {
      grep -Rn --exclude-dir=".svn" --exclude-dir=".git" "$@"
    }

    function hs () {
      ghc -e "$1"
    }

    function tf () {
      nmcli con $1 id TF
    }

    function difc () {
      nvim <(svn diff --changelist "$1")
    }

    function ci() {
      tf up && svn ci --changelist "$1" -m "$2" && tf down
    }

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    alias vim=nvim

    alias up='tf up && sleep 3 && svn up && tf down'

    alias dif='vim <(svn diff)'

  '';

}
