function fish_prompt
	if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
    end

    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty 2>/dev/null)
    end
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l green (set_color -o green)
  set -l magenta (set_color -o magenta)
  set -l red (set_color -o red)
  set -l brred (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l cwd $magenta(prompt_pwd)

  if [ (_git_branch_name) ] 
    set -l repo_branch $green(_git_branch_name)
    set -l dirty ""

    if [ (_is_git_dirty) ] 
      set dirty "$brred-dirty" 
    end
    set repo_info "$blue git:($repo_branch$dirty$blue)"
  end

  set -l venv ''

  if set -q VIRTUAL_ENV
    set venv (set_color -b blue -o white) "[" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  end

  echo -n -s $venv (whoami) ' in'$repo_info $normal':'$cwd  ' '(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
