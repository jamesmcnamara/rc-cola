# if test -e $HOME/.virtualenvs/base
#     vf activate base;
# end
alias pd=pushd;
alias pp=popd;
alias git=hub
alias grepr='grep -ind recurse';
alias git="/usr/local/bin/hub"
alias bell="paplay /usr/share/sounds/ubuntu/stereo/system-ready.ogg"

switch (uname)
    case Darwin
        set -x EDITOR 'mvim -v'
        alias vim=$EDITOR
    case Linux
        set -x EDITOR vim
        set -x BROWSER google-chrome-stable
        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'
end



if test -e /Users/jamesmcnamara/.cargo/bin
    set -x PATH "/Users/jamesmcnamara/.cargo/bin" $PATH
end
set -x LSCOLORS ExFxCxDxBxegedabagacad

function pym
    python -c "print($argv[1])"
end

if type fish_vi_key_bindings > /dev/null
    fish_vi_key_bindings
end

setenv SSH_ENV $HOME/.ssh/environment


function start_agent
    if [ -n "$SSH_AGENT_PID" ]
            ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
            if [ $status -eq 0 ]
                test_identities
            end
    else
            if [ -f $SSH_ENV ]
                . $SSH_ENV > /dev/null
            end
        ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
        if [ $status -eq 0 ]
            test_identities
        else
            echo "Initializing new SSH agent ..."
            ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
            echo "succeeded"
        chmod 600 $SSH_ENV 
        . $SSH_ENV > /dev/null
            ssh-add
        end
    end
end


function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end


function fish_title
    if [ $_ = 'fish' ]
    echo (prompt_pwd)
    else
        echo $_
    end
end

start_agent

# OPAM configuration
source /home/james/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

eval (direnv hook fish)
nvm use latest 
set -x GOPATH /usr/local/go
set -x PATH $PATH $GOPATH/bin
set -x LOG_FORMAT txt
set -x LOG_LEVEL debug 
set -x PAGER "less -s"
set -x PSQL_PAGER "pspg -b"
set -x NPM_TOKEN 32d76c30-8f74-4c54-851a-db7cf233d955
set -x BUILD_DUMMY_WASM_BINARY 1
set -x SKIP_PREFLIGHT_CHECK true
set -x BROWSER google-chrome
set -x CLOUDSDK_PYTHON /usr/bin/python3
set -x ENCORE_INSTALL /home/james/.encore
set -x PATH "$ENCORE_INSTALL/bin" $PATH


# pnpm
set -gx PNPM_HOME "/home/james/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/james/Documents/google-cloud-sdk/path.fish.inc' ]; . '/home/james/Documents/google-cloud-sdk/path.fish.inc'; end

