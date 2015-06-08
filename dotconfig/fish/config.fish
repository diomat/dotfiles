set fish_greeting

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
# set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_dirtystate "⚡"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

# powerline directory
set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish" powerline-setup

function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  set_color white
  echo ""
  printf '%s' ' ┌─'

  #set_color purple
  #printf '%s' [

  set_color purple
  printf '%s' (whoami)

  set_color cyan
  printf '%s' @

  set_color yellow
  printf '%s' (hostname | cut -d . -f 1)

  set_color white
  printf '%s' :

  # show long directorys
  set_color cyan
  if test "$PWD" != "$HOME"
    printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
  else
    printf '%s' '~'
  end

  # show shortenend directorys
  # set_color $fish_color_cwd
  # printf '%s' (prompt_pwd)

  set_color normal
  printf '%s ' (__fish_git_prompt)

  set_color white
  echo ""
  printf '%s' ' └─~> '

  # if not set -q __fish_prompt_normal
  #   set -g __fish_prompt_normal (set_color normal)
  # end

  if not test $last_status -eq 0
  set_color $fish_color_error
  end

end
