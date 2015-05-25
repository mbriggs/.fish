if test -d "/opt/rbenv"
  set -gx RBENV_ROOT /opt/rbenv
else
  set -gx RBENV_ROOT $HOME/.rbenv
end


set -gx fish_user_paths "./bin" \
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

set -gx CLOJURE_EXT ~/.clojure
set -gx GIT_EDITOR "vim"
set -gx EDITOR "vim"
set -gx LESS_TERMCAP_md "$ORANGE"
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US"
set -gx NVM_DIR ~/.nvm
set -gx PURE_DEFAULT_USER 'matt'

set -gx RUBY_GC_MALLOC_LIMIT 80000000

if test -x "`which vim`"
    set -gx EDITOR "`which vim`"
    alias vi="`which vim`"
else
    set -gx EDITOR "`which vi`"
end

if test -x "(which lv)"
    set -gx PAGER "(which lv)"
    set -gx LV "-c"
else if test -x "(which less)"
    set -gx PAGER "(which less)"
    set -gx LESS "-isR"
    alias lv="less"
else
    set -gx PAGER "/bin/more"
end


### Plugins

if test -f /usr/local/Cellar/autojump/22.2.4/share/autojump/autojump.fish
  source /usr/local/Cellar/autojump/22.2.4/share/autojump/autojump.fish
end

if test -f $HOME/.aliases
  source $HOME/.aliases
end

if test -d $RBENV_ROOT
  source (rbenv init -|psub)
end

if test -d $NVM_DIR
  source ./nvm.fish
end

if test -f "/etc/profile.d/nuvango.sh"
  source /etc/profile.d/nuvango.sh
end

if test -f $HOME/.ssh/id_rsa
  ssh-add $HOME/.ssh/id_rsa >/dev/null ^&1
end
