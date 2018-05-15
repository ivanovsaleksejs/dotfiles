{ config, pkgs, ... }:

{

  environment.interactiveShellInit = ''
    HISTCONTROL=ignoreboth

    shopt -s histappend

    shopt -s checkwinsize

    function search () {
      grep -Rn --exclude-dir=".svn" --exclude-dir=".git" "$@"
    }

    alias background='QUERY_STRING="user=AleksejsIvanovs&period=overall&rows=4&cols=7&imageSize=269&frameWidth=1920&frameHeight=1080&noborder=on" ~/.config/i3/lastfm_wp.php > ~/.config/i3/background.png && qiv --root ~/.config/i3/background.png'

    function hs () {
      ghc -e "$1"
    }

    function tf () {
      nmcli --ask con $1 id TF\ New
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
