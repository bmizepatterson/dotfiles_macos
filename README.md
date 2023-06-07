# dotfiles

I learned about dotfiles from [Patrick McDonald](http://dotfiles.eieio.xyz) (cf. [eieioxyz/dotfiles_macos repo](https://github.com/eieioxyz/dotfiles_macos)).

Bootstrapping is automated with [Dotbot](https://github.com/anishathalye/dotbot).

## Ready to set up a new computer?

1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. Install Homebrew and add it to the path:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
   ```bash
   (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/benpatterson/.zprofile
   ```
   
   ```bash
   eval "$(/opt/homebrew/bin/brew shellenv)"`
   ```

2. `git clone https://github.com/bmizepatterson/dotfiles_macos.git ~/.dotfiles`. We'll start with `https` but switch to `ssh` after everything is installed.

3. `cd ~/.dotfiles`

4. If necessary, `git checkout <another_branch>`.

5. If necessary, make changes to [Brewfile](Brewfile) directly.

6. [`./install`](install)

7. Restart computer.

8. Setup up Dropbox (use multifactor authentication!) and allow files to sync before setting up dependent applications.

9. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), add to GitHub, and switch remote URLs.

    ```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t ed25519 -C "7127765+bmizepatterson@users.noreply.github.com"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
    EOF

    # Add private key to ssh-agent
    ssh-add -K ~/.ssh/id_ed25519

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_ed25519.pub

    # Test SSH connection, then verify fingerprint and username
    # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
    ssh -T git@github.com

    # Switch from HTTPS to SSH
    git remote set-url origin git@github.com:bmizepatterson/dotfiles_macos.git
    ```

## Other resources

-   [dotfiles.github.io](http://dotfiles.github.io/).
