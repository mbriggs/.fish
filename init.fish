if test -f $HOME/.ssh/id_rsa
  ssh-add $HOME/.ssh/id_rsa >/dev/null ^&1
end
