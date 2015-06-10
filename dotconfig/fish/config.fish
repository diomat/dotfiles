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

function time --description="Time just like in Bash"
  command time --portability $argv
end

# my aliases
alias rbu="cd /home/dio/projekte/rbu/gitrepo/pizza_man"
# alias lock="i3lock -d -c 000000"
alias h=history
alias c=clear
alias ai="sudo apt-get install"
alias ar="sudo apt-get remove"
alias as="apt-cache show"
alias ase="apt-cache search"

function youvid --description "Download video from Youtube in 720p quality. URL must be in quotes."
  command youtube-dl --restrict-filenames -o "%(title)s.%(ext)s" -wci "$argv"
#youtube-dl --restrict-filenames -o "%(title)s.%(ext)s" -wci --max-quality=22 $1
end

function youvidlow --description "Download video from Youtube in 480p quality. URL must be in quotes."
  youtube-dl --restrict-filenames -o "%(title)s.%(ext)s" -wci --max-quality=18 "$argv"
end

function yoump3 --description "Download video from Youtube and encode it in mp3. URL must be in quotes."
  youtube-dl -o "%(title)s.%(ext)s" --restrict-filenames --max-quality 22 -wci --extract-audio --audio-format mp3 "$argv"
end

function youplaymp3 --description "Download playlist from Youtube and encode it in mp3. Usage: youplaymp3 \$position 'URL'"
  youtube-dl -o "%(title)s.%(ext)s" --restrict-filenames --max-quality 22 -wci --extract-audio --audio-format mp3 --playlist-start $argv[1]  $argv[2]
end

function youplayvid --description "Download video playlist from Youtube. Usage: youplayvid \$position 'URL'"
  youtube-dl -o "%(title)s.%(ext)s" --restrict-filenames --max-quality 22 -wci  --playlist-start $argv[1] $argv[2]
end
