function current_branch
  git branch --no-color | grep "*" | sed "s/* //"
end
