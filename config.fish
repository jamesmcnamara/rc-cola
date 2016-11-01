eval (python3 -m virtualfish);
if test -e $HOME/.virtualenvs/base
    vf activate base;
end
alias pd=pushd;
alias pp=popd;
alias grepr='grep -ind recurse';
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias radd='~/workspace/sandbox/python/radd/compiled/main.py'


if test -e /Users/jamesmcnamara/.cargo/bin
    set -x PATH "/Users/jamesmcnamara/.cargo/bin" $PATH
end

function pym
    python -c "print($argv[1])"
end

if type fish_vi_mode > /dev/null
    fish_vi_mode
end
#this script can never fail
#i use it in the fish_config
#call it with start_agent

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

if type cowsay > /dev/null and type fortune > /dev/null
    fortune | cowsay
end

# OPAM configuration
source /home/james/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
set -x PYTHONSTARTUP $HOME./pysession/pysession.py
set -x PYSESSION_SAVE_OFF True

ssh-add ~/.ssh/sk/*
