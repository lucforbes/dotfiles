prompt_join_colour=0
prompt_path_colour=blue
prompt_git_colour=green
prompt_time_colour=white
prompt_git_colour=green

setopt PROMPT_SUBST

prompt() {
    echo "$(prompt_time)$(prompt_path)$(prompt_end)"
}

prompt_start() {
    echo "%F{$prompt_join_colour}|-[%f"
}

prompt_join() {
    echo "%F{$prompt_join_colour}]-[%f"
}

prompt_end() {
    echo "%F{$prompt_join_colour}]-> %f"
}

prompt_time() {
    echo "$(prompt_start)%B%F{$prompt_time_colour}%D %*%f%b"
}

prompt_path() {
    git rev-parse 2> /dev/null
    if [[ $? -eq 0 ]]; then
        prompt_path_git $*
    else
        echo "$(prompt_join)%B%F{$prompt_path_colour}%~%f%b"
    fi
}

prompt_path_git() {
    echo "$(prompt_path_git_root)$(prompt_path_git_path)"
}

prompt_path_git_root() {
    local repo=$(basename $(git config --get remote.origin.url))
    local branch=$(git rev-parse --abbrev-ref HEAD)
    echo "$(prompt_join)%B%F{$prompt_git_colour}${repo%.git} -< $branch%f%b"
}

prompt_path_git_path() {
    local dir=$(git rev-parse --show-prefix)
    if [[ -n $dir ]]; then
        echo "$(prompt_join)%B%F{$prompt_path_colour}${dir%/}%f%b"
    fi
}

PROMPT='$(prompt)'
