# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/projects"

# Git
alias gs="git status"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(normal)%s%C(reset) %C(dim normal)- %an%C(reset)' --all"
alias gcom=checkoutmain
alias gcod="git checkout develop"
alias gaa="git add ."
alias gc="git commit -m "
alias gp="git push"
alias nah="git reset --hard && git clean -df"
alias gpr="git pull --rebase"
alias amend="git add . && git commit --amend --no-edit"
alias gd="git diff"
alias gds="git diff --staged"
alias gpu="git push -u origin HEAD"
alias gpt="git push origin --tags"
alias grc="git rebase --continue"
alias grh="git reset HEAD^"
alias wip="gaa && gc 'WIP'"

function checkoutmain() {
    git checkout $(git symbolic-ref refs/remotes/origin/HEAD | cut -d'/' -f4)
}

# NPM
alias start="npm run start"
alias watch="npm run watch"
alias prod="npm run production"
alias serve="npm run serve"

# Laravel / PHP
alias art=artisan
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

function artisan() {
    php artisan "$@"
}

alias phpspec='vendor/bin/phpspec'
alias phpunit='vendor/bin/phpunit'

# Other
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
