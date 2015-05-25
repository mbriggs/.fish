# PUREFISH prompt
# mostly stolen from the awesome zsh prompt "pure" by @sindresaurus


function pure_human_time
  set -l days (math "$argv / 60 / 60 / 24")
  set -l hours (math "$argv / 60 / 60 % 24")
  set -l minutes (math "$argv / 60 % 60")
  set -l seconds (math "$argv % 60")

  if [ $days -gt 0 ]
    echo -n -s $days'd '
  end

  if [ $hours -gt 0 ]
    echo -n -s $hours'h '
  end

  if [ $minutes -gt 0 ]
    echo -n -s $minutes'm '
  end

  echo -n -s $seconds's'
end

function pure_current_branch
  set -l branch (command git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')
  set -l dirty (git status --porcelain --ignore-submodules -unormal)
  if [ -n "$dirty" ]
    set_color yellow
  end
  echo -n -s  ' '$branch
end

function pure_last_exec_time
  set -l seconds (math "$CMD_DURATION / 1000")

  if [ $seconds -ge 1 ]
    echo -n -s '  '
    pure_human_time $seconds
  end
end

function pure_git_arrows
  if not command git rev-parse --abbrev-ref @'{u}' >/dev/null ^&1
    return
  end

  set -l arrows ''

  if [ (command git rev-list --right-only --count HEAD...@'{u}' ^/dev/null) -gt 0 ]
    set arrows $arrows'⇣'
  end

  if [ (command git rev-list --left-only --count HEAD...@'{u}' ^/dev/null) -gt 0 ]
    set arrows $arrows'⇡'
  end

  if [ -n "$arrows" ]
    echo -n -s $arrows
  end
end

function pure_prompt_pwd
  set -l realhome ~
  echo -n -s $PWD | sed -e "s|^$realhome|~|" | tr -d "\012"
end

function pure_username
  set -l user (whoami)
  set -l host (hostname -s)
  set -l output $user'@'$host
  set -l show (test "$PURE_DEFAULT_USER" = "$user")

  if [ -n "$SSH_CLIENT" ]
    set -l show 1
    set_color yellow
  end

  if [ "$user" = 'root' ]
    set_color red
  end

  if [ $show ]
    echo -n -s ' '$output
  end
end

function pure_input_prompt
  if [ $argv -ne 0 ]
    set_color red
  end

  echo -n -s '❯ '
end

function fish_prompt
  set -l last_status $status
  set -l git_root (command git rev-parse --show-toplevel ^/dev/null)

  echo
  set_color blue
  pure_prompt_pwd

  set_color blue
  pure_username

  if [ -n "$git_root" ]
    set_color green
    pure_current_branch
    set_color blue
    pure_git_arrows
  end

  set_color purple
  pure_last_exec_time

  set_color purple
  echo
  pure_input_prompt $last_status
  set_color white
end
