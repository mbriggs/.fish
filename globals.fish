if test -d "/opt/rbenv"
  set -U RBENV_ROOT /opt/rbenv
else
  set -U RBENV_ROOT $HOME/.rbenv
end


set -U fish_user_paths "./bin" \
      "$RBENV_ROOT/bin" \
      "$RBENV_ROOT/plugins/ruby-build/bin" \
      "$HOME/.keybase/bin" \
      "$HOME/local/bin" \
      "/Users/matt/.cask/bin" \
      "/usr/local/bin" \
      "/usr/local/sbin" \
      "/usr/bin" \
      "/bin" \
      "/usr/sbin" \
      "/sbin" \
      "/usr/X11/bin" \
      "$HOME/.cask/bin" \
      "./node_modules/.bin" \
      "/usr/local/share/npm/bin" \
      "$HOME/.cabal/bin" \
      "$HOME/scripts"

set -U CLOJURE_EXT ~/.clojure
set -U GIT_EDITOR "vim"
set -U EDITOR "vim"
set -U LESS_TERMCAP_md "$ORANGE"
set -U LC_ALL "en_US.UTF-8"
set -U LANG "en_US"
set -U NVM_DIR ~/.nvm

set -U RUBY_GC_MALLOC_LIMIT 80000000

if test -x "`which vim`"
    set -U EDITOR "`which vim`"
    alias vi="`which vim`"
else
    set -U EDITOR "`which vi`"
end

if test -x "`which lv`"
    set -U PAGER "`which lv`"
    set -U LV "-c"
else if test -x "`which less`"
    set -U PAGER "`which less`"
    set -U LESS "-isR"
    alias lv="less"
else
    set -U PAGER "/bin/more"
end
