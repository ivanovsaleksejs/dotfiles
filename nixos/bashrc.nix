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

      alias background='curl "http://fair.lv/?user=AleksejsIvanovs&period=all&rows=5&cols=9&imageSize=216&noborder=on&ignorePattern=/Best%20Of|Game%20Soundtrack|OST|UKF/&replace[]=d49d023f7f7b53ad140955b0421815cc,718758354a5d26ae8183ededddba7d85" --output ~/.config/i3/background.png && feh --bg-scale ~/.config/i3/background.png'

      function hs () {
        ghc -e "$1"
      }

      function tf () {
        sudo nmcli --ask con $1 id TF
      }

      function difc () {
        nvim <(svn diff --changelist "$1")
      }

      function ci() {
        svn ci --changelist "$1" -m "$2"
      }

      alias ls='ls --color=auto'
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'

      alias vim=nvim

      alias up='tf up && sleep 3 && svn up && tf down'

      alias dif='vim <(svn diff)'

      eval "$(direnv hook bash)"

    '';
  };

}
