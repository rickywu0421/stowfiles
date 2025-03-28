# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions you-should-use zsh-bat)

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
LS_COLORS='di=1;32:ln=1;30;47:so=30;45:pi=30;45:ex=1;31:bd=30;46:cd=30;46:su=30'
LS_COLORS="${LS_COLORS};41:sg=30;41:tw=30;41:ow=30;41:*.rpm=1;31:*.deb=1;31"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

alias config_linux='ARCH=arm64 make defconfig CC=~/Personal/qemu/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc'
alias build_linux='make -j8 ARCH=arm64 CROSS_COMPILE=/home/rickywu0421/Personal/qemu/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- CC=/home/rickywu0421/Personal/qemu/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc 2>&1 | tee b_gcc.log'
alias qemu_arm_gdb='qemu-system-aarch64 \
      -M virt \
      -cpu cortex-a53 \
      -smp 2 \
      -m 4096M \
      -kernel /home/rickywu0421/Personal/qemu/linux/linux-next/arch/arm64/boot/Image \
      -nographic \
      -append "nokaslr console=ttyAMA0 arm64.nopauth rdinit=/linuxrc ignore_loglevel" \
      -initrd "/home/rickywu0421/Personal/qemu/rootfs.cpio" -S -gdb tcp::8899'
alias qemu_arm='qemu-system-aarch64 \
      -M virt \
      -cpu cortex-a53 \
      -smp 2 \
      -m 4096M \
      -kernel /home/rickywu0421/Personal/qemu/linux/linux-next/arch/arm64/boot/Image \
      -nographic \
      -append "nokaslr console=ttyAMA0 arm64.nopauth rdinit=/linuxrc ignore_loglevel" \
      -initrd "/home/rickywu0421/Personal/qemu/rootfs.cpio"'

qemu_x64() {
	if [ -z "$1" ]; then
	       echo "Usage: qemu_x64 <bzImage> <disk image>"
	       return 1
	fi

	if [ -z "$2" ]; then
	       echo "Usage: qemu_x64 <bzImage> <disk image>"
	       return 1
	fi

	qemu-system-x86_64 \
        -m 4G \
        -kernel "$1"  \
        -append "root=/dev/sda console=ttyS0 nokaslr earlyprintk=serial net.ifnames=0" \
        -drive file="$2",format=raw \
        -net user,host=10.0.2.10,hostfwd=tcp::10021-:22 \
        -net nic,model=virtio \
        -enable-kvm \
        -nographic \
        -s
}

alias rvim="nvim -R"

# Set System Locale to enable scripts handling ABI files to make sure that
# these files are not unnecessarily reordered.
export LC_ALL=C.UTF-8

# Helper to call debian/rules quickly
alias fdr="fakeroot debian/rules"

# Set shell variables so various Debian maintenance tools know your real name
# and email address to use for packages
export DEBEMAIL="en-wei.wu@canonical.com"
export DEBFULLNAME="En-Wei Wu"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Add cranky tools to the PATH and enable bash auto-completion
# export PATH=$HOME/canonical/kteam-tools/cranky:$PATH
# export PATH=$HOME/canonical/kteam-tools/maintscripts:$PATH
# source $HOME/canonical/kteam-tools/cranky/cranky-complete.bash

eval "$(zoxide init zsh)"
