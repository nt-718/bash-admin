# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
	echo " 〇Todo List"
	hr
	cat ~/memo/todo.md
		
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
HISTIGNORE='history:pwd:ls:ls *:ll:w:top:df *'      # 保存しないコマンド
HISTCONTROL=ignoreboth                              # 空白、重複履歴を保存しない

hr2() {
	aaa=`hr`
	echo -e "\e[37;2m$aaa\e[m"
}

PROMPT_COMMAND='history -a; history -c; history -r; hr2' # 履歴のリアルタイム反映

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

if [ "$color_prompt" = yes ]; then

	if [ "$name" == nkgw ]; then
		PS1="\[\033[01;36m\]\W\[\033[35m\] \$(bash ~/.gsta.sh)\[\033[00m\]【\t】 \[\033[00m\]\n\[\033[00m\]→ "
		#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\n\[\033[00m\]\$ '
	elif [ "$name" == nnn ];then
		PS1="\[\033[01;36m\]pwd: \[\033[01;36m\]\w\[\033[34m\]\$(__git_ps1)\[\033[00m\]【\t】\n\[\033[00m\]cmd: "
	
	else
		PS1="\[\033[01;36m\]$name\[\033[01;36m\] >> \[\033[01;36m\]\W\[\033[34m\]\[\033[01;34m\] \$(bash ~/.gitsta.sh)\n\[\033[00m\]▶ "
	
	fi

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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
alias cl='clear'
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
	read -p "Input directory name: " mkdirname
	mkdir $mkdirname
	cd $_
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
	source ~/.bashrc
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
	read -p "Input file name: " filename
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

	X=0
	
	for num in `seq 1 $((${#Top[@]}-1))`; do

		echo "<<Conflict $num>>"

		sed -n "$((${Top[num]} -$X)),$((${Bottom[num]} -$X)) p" $filename
		
		hr

		echo "Input the number"
		read -p "HEAD => 1, Other => 2: " number

		if [ "$number" == 1 ]; then
			echo "<<Details>>"

			sed -n "$((${Top[num]} +1 -$X)),$((${Middle[num]} -1 -$X)) p" $filename
			hr

			read -p "Solve it? (y/N):" solve

			if [ "$solve" == y ]; then
				sed -i -e "$((${Top[num]} +1 -$X)),$((${Middle[num]} -1 -$X)) d" $filename
				Y=$(($((${Middle[num]} -1)) - $((${Top[num]} +1)) +1))


				hr

			else
				echo "Quit."

				Y=0

			fi

			#echo "$Y"
			hr

		elif [ "$number" == 2 ]; then
			echo "<<Details>>"

			sed -n "$((${Middle[num]} +1 -$X)),$((${Bottom[num]} -1 -$X)) p" $filename
			hr

			read -p "Solve it? (y/N):" solve

			if [ "$solve" == y ]; then
				sed -i -e "$((${Middle[num]} +1 -$X)),$((${Bottom[num]} -1 -$X)) d" $filename
				Y=$(($((${Bottom[num]} -1)) - $((${Middle[num]} +1)) +1))

				hr

			else
				echo "Quit."

				Y=0

			fi

			#echo "$Y"			

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
