function -d "current branch" B
  git branch --no-color | grep "*" | sed "s/* //"
end
