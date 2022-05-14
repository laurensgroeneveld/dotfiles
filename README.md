# Laurens' dotfiles
My defaults for a new machine, and current ZSH profile. Based off [Dries Vint's dotfiles](https://github.com/driesvints/dotfiles).

## Setting up a new Mac
First ensure the settings of the old Mac are backed up with [mackup](https://github.com/lra/mackup) by running `mackup backup`.

1. Update macOS to the latest version through system preferences
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/laurensgroeneveld/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone git@github.com:laurensgroeneveld/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    ~/.dotfiles/fresh.sh
    ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

Your Mac is now ready to use!
