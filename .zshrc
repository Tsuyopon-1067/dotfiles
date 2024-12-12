# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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
  ~/bin
)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
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
alias shizu='cd ~/OneDrive\ -\ Shizuoka\ University/Documents/ShizuokaUniversity/42'
alias paper='cd ~/OneDrive\ -\ Shizuoka\ University/Documents/ShizuokaUniversity/42/60-ken/paper/'

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

#alias python=/usr/bin/python3
export PATH=$PATH:~/apache-maven-3.9.5/bin

alias cursor="open /Applications/Cursor.app"
alias codee="/opt/homebrew/bin/code"
alias ll="ls -l"
alias gpu="echo kingslanding"

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
}

w3mg() {
    if [ -z "$1" ]; then
        w3m "https://www.google.com/"
    else
        w3m "https://www.google.com/search?q=$*"
    fi
}

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

export ZSH="/opt/homebrew/bin"

texinit() {
	case $1 in
		"1")
			git clone git@github.com:Tsuyopon-1067/tex-template.git && cd tex-template && mv normal/* ./ && rm -rf normal nidan && cd ..
			;;
		"2")
			git clone git@github.com:Tsuyopon-1067/tex-template.git && cd tex-template && mv nidan/* ./ && rm -rf normal nidan && cd ..
			;;
		*)
			echo "usage: texinit [ 1 | 2 }$1"
			;;
	esac
}

gitnewrepo() {
	if [[ "$1" != "public" && "$1" != "private" ]]; then
		echo "usage: gitnewrepo [public | private]"
		exit(1)
	fi
	curl -L https://raw.githubusercontent.com/Tsuyopon-1067/git-create-repository-script/main/git-command.sh | bash -s -- --$1
}


alias bonobono="afplay ~/Music/bonobono.mp3"
amae() {
	if [ "$1" = "-f" ]; then
		afplay ~/Music/amaeFull.mp3
	else
		afplay ~/Music/amaeShort.mp3
	fi
}
eval "$(rbenv init -)"
eval "$(rbenv init -)"

source ~/.env
fetchk() {
	if [ "$1" = "-a" ]; then
		scp $KINGSLANDING_USERNAME@kingslanding:$2 $3
	else
		scp $KINGSLANDING_USERNAME@kingslanding:~/$1 $2
	fi
}

pushk() {
	if [ "$1" = "-a" ]; then
		scp $2 $KINGSLANDING_USERNAME@kingslanding:$3
	else
		scp $1 $KINGSLANDING_USERNAME@kingslanding:~/$2
	fi
}
