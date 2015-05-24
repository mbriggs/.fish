if test -f $HOME/.ssh/id_rsa
  ssh-add $HOME/.ssh/id_rsa >/dev/null ^&1
end

if test uname = "Darwin"
    alias ln="gln"
    alias ls="gls --color"
else
    alias ls="ls --color"
    set -U TERM xterm-256color
end
