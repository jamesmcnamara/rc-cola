eval (python -m virtualfish);
if test -e $HOME/.virtualenvs/base
    vf activate base;
end
alias pd=pushd;
alias pp=popd;

if test -e /Users/jamesmcnamara/.cargo/bin
    set -x PATH "/Users/jamesmcnamara/.cargo/bin" $PATH
end

function pym
    python -c "print($argv[1])"
end

if type fish_vi_mode > /dev/null
    fish_vi_mode
end
