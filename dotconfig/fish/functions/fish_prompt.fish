function fish_prompt --description 'Write out the prompt'
	set -g grey 333

	set -l last_status $status

  set_color cyan --bold
  echo ""
  #printf '%s' ' ┌─'

  #set_color purple
  #printf '%s' [

  set_color normal
  set_color purple
  printf '%s' (whoami)

  set_color cyan
  printf '%s' @

  set_color yellow
  printf '%s' (hostname | cut -d . -f 1)

  set_color white
  #printf '%s' :
  printf '%s' ' '

  # show long directorys
  set_color cyan -b $grey

  #if test "$PWD" != "$HOME"
    #printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    printf "%s" (echo $PWD)
    printf "%s" ' '
    set_color $grey -b black
    printf "%s" ''
#  else
#    printf '%s' '~'
#    set_color $grey -b black
#    printf "%s" ''
#  end

  # show shortenend directorys
  # set_color $fish_color_cwd
  # printf '%s' (prompt_pwd)

  set_color normal
  printf '%s ' (__fish_git_prompt)

  set_color cyan --bold
  echo ""
  #printf '%s' ' └─~> '
  printf '%s' '~> '

  set_color normal
  # if not set -q __fish_prompt_normal
  #   set -g __fish_prompt_normal (set_color normal)
  # end

  if not test $last_status -eq 0
 	 set_color $fish_color_error
  end
end
