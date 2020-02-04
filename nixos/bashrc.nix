{ config, pkgs, ... }:

{

  environment = {
    interactiveShellInit = ''
      HISTCONTROL=ignoreboth

      export PROMPT_COMMAND='history -a'

      export PATH="$PATH:/var/www/esp/esp/xtensa-esp32-elf/bin"

      export IDF_PATH="/var/www/esp/esp-idf"

      shopt -s histappend

      shopt -s checkwinsize

      function search () {
        grep -Rn --exclude-dir=".svn" --exclude-dir=".git" "$@"
      }

      alias sudo='sudo '

      alias background='curl "http://fair.lv/?user=AleksejsIvanovs&period=overall&rows=4&cols=7&imageSize=269&noborder=on&ignorePattern=/Best Of|Game Soundtrack/&replace[]=9e14c69d22da476ab40bd5533c228c56,718758354a5d26ae8183ededddba7d85" --output ~/.config/i3/background.png && feh --bg-scale ~/.config/i3/background.png'

      function hs () {
        ghc -e "$1"
      }

      function tf () {
        sudo nmcli --ask con $1 id TF\ New
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
  };

}
