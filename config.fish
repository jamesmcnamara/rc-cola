eval (python -m virtualfish);
vf activate base;
alias pd=pushd;
alias pp=popd;

set -x PATH "/Users/jamesmcnamara/.cargo/bin" $PATH

function pym
    python -c "print($argv[1])"
end

fish_vi_mode
