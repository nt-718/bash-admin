# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export GITHUB_TOKEN="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"

echo ""
echo "Hello, Terminal!"
echo ""

hr() {
  local start=$'\e(0' end=$'\e(B' line='qqqqqqqqqqqqqqqq'
  local cols=${COLUMNS:-$(tput cols)}
  while ((${#line} < cols)); do line+="$line"; done
  printf '%s%s%s\n' "$start" "${line:0:cols}" "$end"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. ~/z/z.sh

echo "Enter Your Name:"
read -p '>>' name

start_hour=`date +"%-H"`
start_minute=`date +"%-M"`

if [ $name == nnn -o $name == nkgw ]; then
        clear
        echo "Welcome to the Terminal"

elif [ $name == vim ]; then
        clear
        vim ~

else

echo ""
echo "Enter Your Password:"
read -s -p '>>' pass dir opt
echo ""
echo ""
echo "Welcome back $name!"
echo "Let's get down to business!"
sleep 2

clear

if [ $pass == 817nk ]; then

        if [ -z "$dir" ]; then
                z 817nk
        else
            z $dir
        fi
        if [ -z "$opt" ]; then
                :
        elif [ $opt == code ]; then
                code .
        elif [ $opt == term ]; then
            wt.exe -w 0 split-pane -p "ubuntu" ubuntu.exe
        elif [ $opt == vim ]; then
                nvim
        elif [ $opt == pwsh ]; then
                wt.exe -w 0 split-pane -p "powershell" pwsh.exe
        else
                :

        fi

        date +"%Y/%m/%d in Tokyo"
        echo ""
        neofetch
        echo ""


else
        echo ""
        echo -e "\e[31mERROR: INVALID PASSWORD\e[m"
        sleep 3
        exit
fi
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
HISTIGNORE='history:pwd:ls:ls *:ll:w:top:df *'
HISTCONTROL=ignoreboth

hr2() {
        aaa=`hr`
        echo -e "\e[37;2m$aaa\e[m"
}

PROMPT_COMMAND='history -a; history -c; history -r; hr2 '

cmd_count() {
  if [ -z "$i" ]; then
    let i=10
  fi
  let i--
  echo "command count: $i"

  if [ $i == 0 ]; then
          echo "GAMEOVER"
          for I in {1..10}; do
                  sleep 0.5
                  BAR="$(yes . | head -n ${I} | tr -d '\n')"
                  printf "\r[%3d/100] %s" $((I * 10)) ${BAR}
          done
          printf "\n"1
          exit
  fi
}

cmd_cnt() {
  if [ -z "$i" ]; then
    let i=-1
  fi
  let i++

  if [ $i == 0 ]; then
          :
  else
        echo "Command Count: $i"
  fi
}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
#GIT_PS1_SHOWCOLORHINTS=true
#GIT_PS1_SHOWUPSTREAM=auto

#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


####################################################################################

prompt() {


CURRENT=$(pwd)
#echo $CURRENT

DIR_NAME=`echo "$CURRENT" | sed -e 's/.*\/\([^\/]*\)$/\1/'`

if [[ "$DIR_NAME" == "nkgw817" ]]; then
        DIR_NAME="~"
else
        :
fi


columns=$(tput cols)

brank=("")

#version section


cwd=`pwd`

if [[ "$cwd" == /home/nkgw817 ]]; then
        ver=""
else
        filep=`ls | grep -F .py`
        filen=`ls | grep -F node_modules`
        fileg=`ls | grep -F main.go`
        filer=`ls | grep -F Gemfile`
        filev=`ls | grep -F .vim`
        files=`ls | grep -F .sh`
        filerust=`ls | grep -F .rs`

        ver=""

        if [[ -z "$files" ]]; then
                :
        else
                #ver=`go version | awk '{print $3}'`
                ver="bash:5.0.17"

        fi
        if [[ -z "$filev" ]]; then
                :
        else
                #ver=`go version | awk '{print $3}'`
                ver="Nvim:0.6.1"

        fi

        if [[ -z "$filep" ]]; then
                :
        else
                #ver=`python3 --version | awk '{print $2}'`
                ver="Python:3.8.10"

        fi

        if [[ -z "$filen" ]]; then
                :
        else
                #ver=`node --version | awk '{print $1}'`
                ver="node:16.14.1"
        fi

        if [[ -z "$fileg" ]]; then
                :
        else
                #ver=`go version | awk '{print $3}'`
                ver="Go:1.18.3"

        fi

        if [[ -z "$filer" ]]; then
                :
        else
                #ver=`go version | awk '{print $3}'`
                ver="Rails:7.0.3"

        fi

        if [[ -z "$filerust" ]]; then
                :
        else
                ver="Rust:1.62.0"
        fi

fi

#git branch section

if [[ "`echo "$(pwd)" | grep "/mnt"`" ]]; then

        parse_git_branch() {
                git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
        }
        git=$(parse_git_branch)
        gitt=""

else
        branch=`echo "$(__git_ps1)" | cut -d"(" -f2 | cut -d")" -f1 | cut -d" " -f1`

        if [[ "`echo "$(__git_ps1)"`" == "" ]]; then
                git=""
                gitt=""

        else
                bbb=0
                for file in `git add -n .`;

                do

                        bbb=$(($bbb + 1))

                done
                if [[ $bbb == 0 ]]; then
                        bbb=""
                else
                        bbb="+$(($bbb / 2))"

                fi

                if [[ "`echo "$(__git_ps1)" | grep "%"`" ]]; then
                        git="at $branch (untracked) $bbb "

                elif [[ "`echo "$(__git_ps1)" | grep "*"`" ]]; then
                        git="at $branch (unstaged) $bbb "

                elif [[ "`echo "$(__git_ps1)" | grep "+"`" ]]; then
                        git="at $branch (uncommited) $bbb "

                else
                        git="at $branch "

                fi
                gitt=""
        fi

fi



# battery section

ppp=`acpi | awk '{print $4}' | cut -f 1 -d "%"`
charge=`acpi | awk '{print $3}'`
if [[ "$charge" == Discharging, ]]; then
        battery="🍎$ppp%"
else
        battery="🍏$ppp%"
fi

#blank section

job="$(jobscount)"

for i in `seq 1 $(( $columns - ${#DIR_NAME} - ${#job} - ${#ver} - ${#git} - ${#battery} -15 ))`; do
        brank+=("")

done

#echo section

echo -e "\e[33m$git\e[m${brank[@]}$gitt \e[01;30m$ver $battery $job \e[m"


}


####################################################################################


jobscount() {
  set -- $(jobs -rp)
  set $# $(jobs -sp)
  set $1 $(($#-1))
  if [[ $1 -ne 0 ]] || [[ $2 -ne 0 ]]; then echo "${1}r/${2}s"; fi
}


if [ "$color_prompt" = yes ]; then

        if [ "$name" == nkgw -o "$name" == vim ]; then
                #PS1="\[\033[01;36m\]\W\[\033[35m\] \$(bash ~/.gsta.sh)\[\033[00m\]【\t】 \[\033[00m\]\n\[\033[00m\]→ "
                #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\n\[\033[00m\]\$ '
                PS1="\[\033[01;36m\]\W \[\033[01;30m\]\$(prompt)\[\033[01;30m\]\t \[\033[00m\]\n\[\033[00m\]→ "

        elif [ "$name" == nnn ];then
                #PS1="\[\033[01;36m\]pwd: \[\033[01;36m\]\w\[\033[34m\]\$(__git_ps1)\[\033[00m\] 【\t】\n\[\033[00m\]cmd: "
                PS1="\[\033[01;36m\]\W\[\033[35m\]\$(__git_ps1)\[\033[00m\]【\t】 \[\033[00m\]\n\[\033[00m\]→ "
        else
                PS1="\[\033[01;36m\]\W\[\033[35m\] \$(bash ~/.gsta.sh)\[\033[00m\]\$(bash ~/ver.sh) \$(bash ~/battery.sh) \t \[\033[00m\]\n\[\033[00m\]→ "

        fi

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
        ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# another aliases
alias open='explorer.exe .'
alias vim='nvim'
alias term='wt.exe -w 0 split-pane -p "ubuntu" ubuntu.exe'
alias pwsh='wt.exe -w 0 split-pane -p "powershell" pwsh.exe'
alias ccc='cmatrix -C cyan'
alias nf='neofetch'
alias cron='bash /mnt/c/Users/817nk/cron-master.sh'
alias backup='bash /mnt/c/Users/817nk/backup.sh'
#alias cl='clear'
alias rmd='rm -rf'
alias g='git'
alias weather='curl wttr.in/Tokyo'
alias moon='curl wttr.in/Moon'
alias line='/mnt/c/Users/817nk/AppData/Local/LINE/bin/LineLauncher.exe'
alias rails='/home/nkgw817/.rbenv/shims/rails'
alias os='cat /etc/os-release'
alias d='docker'
alias dc='docker-compose'
alias dcup='docker-compose up -d --build'
alias dcbd='docker-compose build --no-cache'
alias pbcopy='xsel --clipboard --input'
alias Pwd='pwd | xsel --clipboard --input'
alias slct='bash ~/.selector.sh'
alias python='python3'
alias norehat='vim ~/memo/noreha.txt'
#alias ls='(ls -a; hr2) > /dev/pts/2'
#alias hello='echo "Hello World!" > /dev/pts/2'
#alias cl='clear > /dev/pts/2'
alias word='/mnt/c/Program\ Files/Microsoft\ Office/root/Office16/WINWORD.EXE'
alias excel='/mnt/c/Program\ Files/Microsoft\ Office/root/Office16/EXCEL.EXE'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#. ~/z/z.sh

Git() {
echo -e "\e[31m Git Menu\e[m"
hr
echo "f: fetch and merge"
echo "p: add, commit and push"
echo "r: make a new repository"
echo "s: show differences and reset"
hr
read -p "Press key: " inp
echo ""

if [ -z "$inp" ]; then
        echo "Quit."

elif [ $inp == f ]; then

read -p "Fetch from github? (y/N): " fetch
        if [ $fetch == "y" ]; then
                git fetch origin ${CULLENT_BRANCH};
                git status
                git tree

                read -p "Merge it? (y/N): " merge

                if [ $merge == "y" ]; then
                        git merge origin/${CULLENT_BRANCH}
                else
                        :
                fi
        else
                exit 0
        fi
elif [ $inp == p ]; then

        read -e -p "Enter File Name to add: " addname
        if [ -z "$addname" ]; then
                git add .
        else
                git add $addname;
        fi
    git status;
    read -p "Commit with this Content? (y/N): " yesno
    case "$yesno" in

    [yY]*) read -p "Input Commit Message: " msg;
                if [ -z $msg ]; then
                        git commit -m "`date +"%m%d"`"
            CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
            git push origin ${CULLENT_BRANCH};
                else
                        git commit -m "`date +"%m%d"`""_""$msg";
                        CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
                        git push origin ${CULLENT_BRANCH};
                fi;;
    *) echo "Quit." ;;
    esac

elif [ $inp == r ]; then

read -p "Make a new repository? (y/N): " yn

if [ $yn == y ]; then

        read -e -p "Input Repository Name: " rep
        echo "Visibility setting"
        echo "Private: 1, Public: 2"
        read -p "Input number: " visibility
        read -p "Input Commit Message: " msg
        read -p "Input Branch Name: " name

        if [ "$visibility" = "1" ]; then
                visibility=private
        elif [ "$visibility" = "2" ]; then
                visibility=public
        else
                exit 0
        fi

        if [ -z $msg ]; then
                msg="first commit"
        else
                msg=$msg
        fi

        if [ -z $name ]; then
                name="main"
        else
                name=$name
        fi


        gh repo create $rep --$visibility
        echo "# $rep" >> README.md
        git init
        git add README.md
        git commit -m "$msg"
        git branch -M $name
        git remote add origin git@github.com:nt-718/$rep.git
        git push -u origin $name

else
        echo "Quit. "
fi
elif [ $inp == s ]; then

        git log --pretty=oneline
        echo ""
        read -p "Enter Message: " cmt
        show=`git log --pretty=oneline --grep=$cmt | awk '{print $1}'`
        echo ""
        git show $show | bat -l rs
        echo ""
        read -p "Reset the commit? (y/N): " rst
        if [ $rst == y ]; then
                git reset --hard $show
        else
                echo "Quit. "
        fi

else
        :
fi
}

gdiff() {
        git ls | while read line;
        do
                file=`echo $line`
                difference=`git diff $file`

                if [ "$difference" = "" ]; then
                        echo "#$file: Nothing has changed"
                        echo ""
                else
                        echo -e "\e[31m#$file has changed\e[m"
                        hr
                        git add . -N
                        git diff $file
                        hr
                        echo ""
                fi
        done
}

gst() {
        gh issue list
        hr2
        gh pr list
}

Exit() {

end_hour=`date +"%-H"`
end_minute=`date +"%-M"`
if [ $end_minute -lt $start_minute ]; then
        hour=$((end_hour-start_hour -1))
        minute=$((end_minute-start_minute +60))
else
        hour=$((end_hour-start_hour))
        minute=$((end_minute-start_minute))
fi

echo "$hour hours and $minute minutes has passed!"
echo "Good job today!"
echo ""

read -p "Make a Todo List? (y/N): " td
if [ $td == y ]; then
        bash /mnt/c/Users/817nk/task.sh
        read -p "Press enter key to exit." ntr
        sleep 2
        exit
else
        read -p "Press enter key to exit." ntr
        sleep 2
        exit
fi

}

WH() {

        end_hour=`date +"%-H"`
        end_minute=`date +"%-M"`
        if [ $end_minute -lt $start_minute ]; then
                hour=$((end_hour-start_hour -1))
                minute=$((end_minute-start_minute +60))
        else
                hour=$((end_hour-start_hour))
                minute=$((end_minute-start_minute))
        fi

        echo "You are working for $hour hours and $minute minutes now."

}

eval "$(gh completion -s bash)"

Mkdir() {
        if [ -z "$1" ]; then
                :
        else

                mkdir $1
                cd $_
        fi
}

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

todo() {
        bat ~/memo/todo.md
}

todoe() {
        vim ~/memo/todo.md
}

init() {
        clear
        source ~/.bashrc
}

note() {
        vim ~/memo/note.txt
}

todoa() {
        read -p "Input the task name to add: " task
        read -p "Input the date: " date

        echo "・$task $date" >> ~/memo/todo.md
        bat ~/memo/todo.md
}

Rm() {
        read -e -p"Input directory of file name: " rmname
        read -p"Delete Permanently? (y/N): " check
        if [ "$check" == n ]; then
                mv "`pwd`"/"$rmname" /mnt/c/Users/817nk/backup
        elif [ "$check" == y ]; then
                rm -rf $rmname
        else
                echo "Quit."
        fi
}

skd() {

        youbi=`date +%u`

        if [ $youbi == 1 ]; then
                echo ""
                echo "Monday"
                hr
                cat ~/memo/schedule/mon.txt

        elif [ $youbi == 2 ]; then
                echo ""
                echo "Tuesday"
                hr
                cat ~/memo/schedule/tue.txt

        elif [ $youbi == 3 ]; then
                echo ""
                echo "Wednesday"
                hr
                cat ~/memo/schedule/wed.txt

        elif [ $youbi == 4 ]; then
                echo ""
                echo "Thursday"
                hr
                cat ~/memo/schedule/thu.txt

        elif [ $youbi == 5 ]; then
                echo ""
                echo "Friday"
                hr
                cat ~/memo/schedule/fri.txt

        elif [ $youbi == 6 ]; then
                echo ""
                echo "Saturday"
                hr
                cat ~/memo/schedule/sat.txt

        else
                echo ""
                echo "Sunday"
                hr
                cat ~/memo/schedule/sun.txt

        fi

}

consol() {
        read -e -p "Input file name: " filename
        top=`sed -n "/<<<<<<</=" $filename`
        middle=`sed -n "/=======/=" $filename`
        bottom=`sed -n "/>>>>>>>/=" $filename`

        Top=("")
        Middle=("")
        Bottom=("")

        for tp in $top; do
                Top+=("$tp")
        done

        for md in $middle; do
                Middle+=("$md")
        done

        for bt in $bottom; do
                Bottom+=("$bt")
        done

        echo -e "\e[31m$((${#Top[@]}-1))\e[m conflicts exist"

        echo ""

        X=0

        for num in `seq 1 $((${#Top[@]}-1))`; do

                echo -e "\e[31m<<Conflict $num>>\e[m"
                echo ""

                sed -n "$((${Top[num]} -$X)),$((${Bottom[num]} -$X)) p" $filename

                hr

                echo "Input the number"
                read -p "HEAD => 1, Other => 2, Edit on vim => 3 " number

                if [ "$number" == 1 ]; then

                        echo ""
                        echo -e "\e[31m<<Details>>\e[m"
                        echo ""

                        sed -n "$((${Top[num]} +1 -$X)),$((${Middle[num]} -1 -$X)) p" $filename
                        hr

                        read -p "Delete it? (y/N): " solve

                        if [ "$solve" == y ]; then
                                sed -i -e "$((${Top[num]} -$X)),$((${Middle[num]} -$X)) d; $((${Bottom[num]} -$X)) d" $filename

                                Y=$((${Middle[num]} - ${Top[num]} +2))

                        else
                                echo "Quit."

                                Y=0

                        fi

                        #echo "$Y"
                        hr

                elif [ "$number" == 2 ]; then
                        echo -e "\e[31m<<Details>>\e[m"

                        sed -n "$((${Middle[num]} +1 -$X)),$((${Bottom[num]} -1 -$X)) p" $filename
                        hr

                        read -p "Delete it? (y/N): " solve

                        if [ "$solve" == y ]; then
                                sed -i -e "$((${Middle[num]} -$X)),$((${Bottom[num]} -$X)) d; $((${Top[num]} -$X)) d" $filename

                                Y=$((${Bottom[num]} - ${Middle[num]} +2))

                        else
                                echo "Quit."

                                Y=0

                        fi

                        #echo "$Y"

                elif [ "$number" == 3 ]; then
                        echo -e "\e[31m※手動で修正する場合、残りのコンフリクトはconsolを実行し直 す必要があります。\e[m"
                        read -p "open vim ? (y/N): " open
                        if [ "$open" == y ]; then
                                vim
                                exit 0
                        else
                                echo "Quit."
                        fi

                else
                        echo "error"

                fi

                X=$((X+Y))

        done


        #sed -i -e "$top s/^/# /g" $filename
        #sed -i -e "$middle s/^/# /g" $filename
        #sed -i -e "$bottom s/^/# /g" $filename

        #sed "$(($top +1)),$(($middle -1)) d" $filename

}

theme() {
        #read -p "Select theme: " theme

        filename=/mnt/c/Users/817nk/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json

        white='"colorScheme": "One Half Light",'
        dark='"colorScheme": "Original Dark",'

        now=`sed -n '/"colorScheme": "One Half Light"/=' $filename`

        if [ -z $now ]; then



        #if [ "$theme" == white ]; then

                line=`sed -n '/"colorScheme":/=' $filename`
                sed -i "$line c $white" $filename
                #sed -i '/"colorScheme": "Original Dark"/c "colorScheme": "One Half Light",' $filename
                #export PS1="\[\033[01;36m\]\W\[\033[35m\] \$(bash ~/.gsta.sh)\[\033[00m\]【\t】 \[\033[00m\]\n\[\033[00m\]→ "
                #echo -ne '\033]0;'"$1"'\a'
        else
        #elif [ "$theme" == dark ]; then

                line=`sed -n '/"colorScheme":/=' $filename`
                sed -i "$line c $dark" $filename

                #sed -i '/"colorScheme": "One Half Light"/c "colorScheme": "Original Dark",' $filename
                #export PS1="\[\033[01;36m\]\W\[\033[35m\] \$(bash ~/.gsta.sh)\[\033[00m\]【\t】 \[\033[00m\]\n\[\033[00m\]→ "
                #echo -ne '\033]0;'"$1"'\a'

        #else
                #echo "Quit."
        fi

}

bgi() {

        read -p "Select backgroundImage: " back
        filename=/mnt/c/Users/817nk/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
        line=`sed -n '/"backgroundImage": /=' $filename`
        image1='"backgroundImage": "C:\\\\Users\\\\817nk\\\\Downloads\\\\13.jpg",'
        image2='"backgroundImage": "C:\\\\Users\\\\817nk\\\\OneDrive\\\\画像\\\\desktop\\\\img19.jpg",'
        image3='"backgroundImage": "C:\\\\Users\\\\817nk\\\\OneDrive\\\\画像\\\\desktop\\\\17_20220312070248.png",'
        imageNone='// "backgroundImage": "C:\\\\Users\\\\817nk\\\\Downloads\\\\15.jpg",'

        if [ -z $line ]; then
                sed -i '52i "backgroundImage": ' $filename
                line=`sed -n '/"backgroundImage": /=' $filename`

        else
                :

        fi

        if [ "$back" == 1 ]; then
                sed -i "$line c $image1" $filename

        elif [ "$back" == 2 ]; then
                sed -i "$line c $image2" $filename

        elif [ "$back" == 0 ]; then
                sed -i "$line c $imageNone" $filename

        else
                sed -i "$line c $image3" $filename

        fi
}

color() {
        for i in `seq 30 38` `seq 40 47` ; do
                for j in 0 1 2 4 5 7 ; do
                        printf "\033[${j};${i}m"
                 printf "${j};${i}"
                        printf "\033[0;39;49m"
                   printf " "
                done
                printf "\n"
        done
}



j() {

        CURRENT=$(pwd)

        if [[ -z "$1" ]]; then

                check=`cat ~/zzz.txt | grep -x $CURRENT`

                if [[ -z "$check" ]]; then

                        echo "$CURRENT" >> ~/zzz.txt
                fi

        elif [[ "$1" == -e ]]; then
                vim ~/zzz.txt

        elif [[ "$1" == -s ]]; then

                PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'j'

        else

                while read line
        do
                #lineforgrep=${line,,}
                DIR_NAME=`echo "$line" | grep "$1" | sed -e 's/.*\/\([^\/]*\)$/\1/'`

                [[ "$DIR_NAME" =~ "$1" ]] && break

        done < ~/zzz.txt

                if [[ -z "$line" ]]; then
                        echo "No such a directory"
                else
                        cd "$line"
                fi
        fi
}


google() {
    url='https://google.co.jp/search?q='
    for t;
    do
        url="${url}${t}+"
    done
    echo $url
        "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" $url
        :
}

youtube() {
        url2='https://www.youtube.com/results?search_query='
    url1='https://www.youtube.com'
        if [ -z $1 ]; then
                echo $url1
                "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" $url1
                :
        else
                for t;
                do
                        url2="${url2}${t}+"
                done
                echo $url2
                "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" $url2
                :
        fi
}

wiki() {
        url='https://ja.wikipedia.org/wiki/'
    for t;
    do
        url="${url}${t}"
    done
    echo $url
        "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" $url
        :
}

github() {
        url='https://github.com/'
    echo $url
        "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" $url
        :
}

refere() {
        read -p "Input the title: " title
        read -p "Input the URL: " content

        echo "・$title" >> ~/URL.txt
        echo "$content" >> ~/URL.txt
        echo "" >> ~/URL.txt

        echo ""

        echo "~/URL.txt"
        hr2
        cat ~/URL.txt
}

rfr() {
        read -p "Input the title: " title
        hit=`grep $title ~/URL.txt`
        echo "$hit"
}

title() {
        ls
        echo ""
        python3 ~/dev/python/Scraping/main.py
}

ccd() {
        if [ $1 == 2 ]; then
                cd ../../

        elif [ $1 == 3 ]; then
                cd ../../../

        elif [ $1 == 4 ]; then
                cd ../../../../
        else
                :
        fi


}

hello() {
        #array=("H" "E" "L" "O")
        array=("🍞" "🥖" "🥐" "🥞" "🧇" "🥪" "🍩" "🧋" "🍦" "🥨")
        HELLO=`echo "${array[$(($RANDOM % ${#array[*]}))]} ${array[$(($RANDOM % ${#array[*]}))]} ${array[$(($RANDOM % ${#array[*]}))]}"`


        if [ "$HELLO" == "🍞 🍞 🍞" -o "$HELLO" == "🥖 🥖 🥖" -o "$HELLO" == "🥐 🥐 🥐" -o "$HELLO" == "🥞 🥞 🥞" -o "$HELLO" == "🧇 🧇 🧇" -o "$HELLO" == "🥪 🥪 🥪" -o "$HELLO" == "🍩 🍩 🍩" -o "$HELLO" == "🧋 🧋 🧋" -o "$HELLO" == "🍦 🍦 🍦" -o "$HELLO" == "🥨 🥨 🥨" ]; then
                echo "Delisious! $HELLO"

        else
                echo $HELLO
        fi

}

cl() {
        clear

}
. "$HOME/.cargo/env"

source /home/nkgw817/.config/broot/launcher/bash/br

export EDITOR=nvim
