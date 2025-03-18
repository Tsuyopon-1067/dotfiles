typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#a0a0a0'
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
precmd() { add_newline }

autoload -Uz colors && colors
PROMPT="%F{green}%n%f %F{cyan}($(arch))%f:%F{blue}%~%f"$'\n'"%# "

if [[ -f ~/.config/powerline/bindings/zsh/powerline.zsh ]]; then
    powerline-daemon -q
    . ~/.config/powerline/bindings/zsh/powerline.zsh
fi

# 大文字小文字区別なし
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
USE_POWERLINE="true"
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias vi='nvim'
alias tokic='cd ~/Documents/tokinagaraC'
alias tokij='cd ~/Documents/tokinagaraJava'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias abc='cd ~/gitFiles/atcoder/abc/'
alias arc='cd ~/gitFiles/atcoder/arc/'
alias algo='cd ~/gitFiles/algo'
alias dp='cd ~/algo/dp'
alias snip='cd ~/.config/nvim/snippets'
alias via='vi a.cpp'
alias vib='vi b.cpp'
alias vic='vi c.cpp'
alias vid='vi d.cpp'
alias vie='vi e.cpp'

alias dlst='vi ~/Documents/gitFiles/doneList/doneList.txt'

re()
{
	file=$1
	name=${file%.*}
	ext=${file##*.}
    fileLen=${#1}
    allName="$@"
    allLen=${#allName}
    option=${allName: -$allLen:$allLen}
	case "$ext" in
		"c" )
			gcc $name.$ext -o $name.out
			./$name.out
			;;
		"cpp" )
			g++-13 $name.$ext -o $name.out
			./$name.out
			;;
		"fs" )
			fsharpc $name.$ext
			mono $name.exe
			;;
		"go" )
			go run $name.go
			;;
		"java" )
			javac $name.java
			java $name $option
			;;
		"kt" )
            kotlinc $name.kt -include-runtime -d $name.jar
            java -jar $name.jar
			;;
		"py" )
			python3 $name.$ext;;
		"rb" )
			rb $name.$ext;;
	esac
}
alias shizuoka='cd ~/OneDrive\ -\ Shizuoka\ University/Documents/ShizuokaUniversity/'
alias room='cd ~/Documents/gitFiles/room1067'
alias zshrc='nvim ~/.zshrc'
alias adad='cd ~/gitFiles/ad'
alias apap='cd ~/gitFiles/AntiApple/anti-apple'
alias seisen='cd ~/gitFiles/atcoder/seisen100'
alias sekibun='cd ~/OneDrive\ -\ Shizuoka\ University/Documents/ShizuokaUniversity/あそび/今週の積分'
alias szpp='cd ~/gitFiles/szpp'
export PATH=$PATH:~/.cargo/bin

gggit()
{
    git add .
    git commit -m $1
    git push origin main
}
mkc()
{
    mkdir $1
    cd $1
}
export PATH="/usr/local/bin:$PATH"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=/opt/homebrew/bin:$PATH
#alias gcc='gcc-13'
#alias g++='g++-13'

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ncurses/lib/pkgconfig:$PKG_CONFIG_PATH"
export CPPFLAGS="-I/opt/homebrew/opt/ncurses/include"
export LDFLAGS="-L/opt/homebrew/opt/ncurses/lib"
eval "$(rbenv init -)"
export DENO_INSTALL="/Users/tsuyopon/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

alias python=/usr/bin/python3
export PATH=$PATH:~/apache-maven-3.9.5/bin

alias cursor="open /Applications/Cursor.app"
alias codee="/opt/homebrew/bin/code"
alias ll="ls -l"

# bun completions
[ -s "/Users/tsuyopon/.bun/_bun" ] && source "/Users/tsuyopon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

atcargo()
{
	cargo new $1
	cd $1
	echo 'proconio = "0.4.1"' >> Cargo.toml
	mkdir -p src/bin
	cd src/bin
	create_rs_file a.rs
	create_rs_file b.rs
	create_rs_file c.rs
	create_rs_file d.rs
	create_rs_file e.rs
	cargo run --bin a
	cd ../../../
}

create_rs_file() {
	echo 'fn main() {' >> $1
	echo '}' >> $1
}

oboe() {
	echo 'w3m'
	echo 'gitnewrepo'
	echo 'https://github.com/ylab-dev/Unipp'
}

unipinfo() {
	echo 'docker-compose build'
	echo 'docker-compose run --rm next yarn install'
	echo 'docker-compose up'
}

alias w3mg="w3m https://www.google.com/"

gitpon() {
	git clone git@github.com:tsuyopon-1067/$1.git
}

# git-prompt
source ~/.zsh/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST ; PS1='%F{green}%n%f %F{cyan}($(arch))%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
%# '

#PROMPT="%F{green}%n%f %F{cyan}($(arch))%f:%F{blue}%~%f"$'\n'"%# "
export PATH=$PATH:/usr/local/texlive/2024/bin/universal-darwin
export PATH=$PATH:/usr/bin/gcc

texinit() {
	if [ $1 = "1" ]; then
		git clone git@github.com:Tsuyopon-1067/tex-template.git && cd tex-template && mv normal/* ./ && rm -rf normal nidan && cd ..
	elif [ $1 = "2" ]; then
		git clone git@github.com:Tsuyopon-1067/tex-template.git && cd tex-template && mv nidan/* ./ && rm -rf normal nidan && cd ..
	fi
}

alias gitnewrepo="curl https://raw.githubusercontent.com/Tsuyopon-1067/git-create-repository-script/main/git-command.sh | sh"
eval "$(starship init zsh)"
