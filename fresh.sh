#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check for nvm and install if we don't have it
if test ! $(which nvm); then
  /bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh)"
fi

if alias $DOTFILES >/dev/null 2>&1; then 
  echo 'ZSH profile not loaded correctly, open a new instance of Terminal'
  exit
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install imagick

# Install global Composer packages
/opt/homebrew/bin/composer global require laravel/installer laravel/valet spatie/visit

# Install latest Node LTS
nvm install --lts
nvm use --lts

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a projects directory
mkdir $HOME/projects

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Symlink the global gitignore file
ln -s $DOTFILES/.gitignore_global $HOME/.gitignore_global

# Hush "last login" message in iTerm and Terminal
touch .hushlogin

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
