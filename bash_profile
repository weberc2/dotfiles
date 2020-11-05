### GIT BASH COMPLETION ###
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
   . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi
### END GIT BASH COMPLETION ###


### ~/.bin ###
export PATH=$HOME/.bin:$PATH
### END ~/.bin ###

### PS1 ###
bold="\[$(tput bold)\]"
blackFG="\[$(tput setaf 0)\]"
blackBG="\[$(tput setab 0)\]"
redFG="\[$(tput setaf 1)\]"
redBG="\[$(tput setab 1)\]"
greenFG="\[$(tput setaf 2)\]"
greenBG="\[$(tput setab 2)\]"
yellowFG="\[$(tput setaf 3)\]"
yellowBG="\[$(tput setab 3)\]"
blueFG="\[$(tput setaf 4)\]"
blueBG="\[$(tput setab 4)\]"
reset="\[$(tput sgr0)\]"
export PROMPT_COMMAND='update_terminal_cwd;\
export GIT_BRANCH=$(git branch 2> /dev/null | grep \* | awk "{ print \$2 }")
__dir="${bold}${greenBG}${blackFG} \w ${reset}"
__aws="${bold}${yellowBG}${blackFG} \${AWS_PROFILE:null}/${AWS_DEFAULT_REGION:null} ${reset}"
__kube="${bold}${blueBG}${blackFG} \$(kubectl config current-context) ${reset}"
__git=""
if [[ -n $GIT_BRANCH ]]; then
    __git="${bold}${redBG}${blackFG} \${GIT_BRANCH} ${reset}"
fi
__arrow=" ${greenFG}${blackBG}▶${reset} "
export PS1="${__dir}${__aws}${__kube}${__git}${__arrow}"'

export AWS_DEFAULT_REGION=us-west-2

function profile-set() {
    if [[ -z "$1" ]]; then
        echo "USAGE: profile-set PROFILE"
        return 1
    fi
    export AWS_PROFILE="$1"
}

function region-set() {
    if [[ -z "$1" ]]; then
        echo "USAGE: region-set PROFILE"
        return 1
    fi
    export AWS_DEFAULT_REGION="$1"
    export AWS_REGION="$1"
}

### END PS1 ###

### GIT BASH COMPLETION ###
# https://stackoverflow.com/a/18898614
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
### END GIT BASH COMPLETION ###

###_begin_ttt_install_block_###
export PATH=$HOME/.ttt_home:$PATH
###_end_ttt_install_block_###

### GO ###
export PATH=/usr/local/go/bin:$HOME/go/bin:$PATH
### END GO ###

### GOOGLE CLOUD SDK ###
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.bin/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/.bin/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.bin/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/.bin/google-cloud-sdk/completion.bash.inc"; fi
### END GOOGLE CLOUD SDK ###

### NIX ###
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
### END NIX ###

### TERRAFORM ###
alias tf=terraform
export PATH=$HOME/.tfenv/bin:$PATH
### END TERRAFORM ###

### DIRENV ###
eval "$(direnv hook bash)"
### END DIRENV ###

### KUBECTL ###
source <(kubectl completion bash)
alias k=kubectl
alias kp="kubectl get pod"
alias kl="kubectl logs"
alias ks="kubectl get service"
alias kdp="kubectl describe pod"

function ksh() {
    kubectl exec -it "$1" -- /bin/bash
}
### END KUBECTL ###
