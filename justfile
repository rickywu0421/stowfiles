default:
  just basic
  just zsh
  just stow

basic:
  echo "Installing base dev tools..."

  ## Installation
  sudo apt update
  sudo apt install -y \
    git curl wget unzip \
    ripgrep fd-find fzf zoxide bat \
    stow zsh tldr
  sudo snap install nvim --classic

  ## Creating soft links
  sudo ln -sf $(which fdfind) /usr/bin/fd
  sudo ln -sf $(which batcat) /usr/bin/bat

  echo "Basic installation done"

zsh:
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  # chsh -s $(which zsh)
  echo "If you want to change your default shell to zsh, run: chsh -s $(which zsh)"

  echo "Installing Plugins for zsh"
  git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
  git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-bat

stow:
  echo "Installing stow files..."
  mv ~/.zshrc ~/.zshrc.orig
  stow zsh git nvim

