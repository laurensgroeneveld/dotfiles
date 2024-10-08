# Laurens' dotfiles
My defaults for a new machine, and current ZSH profile. Based off [Dries Vint's dotfiles](https://github.com/driesvints/dotfiles).

## Setting up a new Mac
First ensure the settings of the old Mac are backed up with [mackup](https://github.com/lra/mackup) by running `mackup backup`.

1. Update macOS to the latest version through system preferences
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/laurensgroeneveld/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Copy the SSH key by running

    ```zsh
    pbcopy < ~/.ssh/id_ed25519.pub
    ```

4. [Add the SSH key](https://github.com/settings/ssh/new) to your GitHub account.

5. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone git@github.com:laurensgroeneveld/dotfiles.git ~/.dotfiles
    ```

6. Run the installation with:

    ```zsh
    ~/.dotfiles/fresh.sh
    ```
    This will install Oh My Zsh the first time.

7. Restart Terminal or open a new window for the Oh My Zsh configuration to take effect, and run the install script a second time.

8. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
9. Restart your computer to finalize the process

Your Mac is now ready to use!
