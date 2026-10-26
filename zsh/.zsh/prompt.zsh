prompt_join_colour=0
prompt_path_colour=blue
prompt_git_colour=green
prompt_time_colour=white
prompt_user_host_colour=14
prompt_git_path_relative=true

setopt PROMPT_SUBST

prompt() {
    echo "$(prompt_start)$(prompt_time)$(prompt_join)$(prompt_path)$(prompt_end)"
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
    echo "%B%F{$prompt_time_colour}%*%f%b"
}

prompt_user_host() {
    echo "%B%F{$prompt_user_host_colour}%n@%m%f%b"
}

prompt_path() {
    git rev-parse 2> /dev/null
    if [[ $? -eq 0 ]]; then
        prompt_path_git
    else
        prompt_path_full
    fi
}

prompt_path_full() {
    echo "%B%F{$prompt_path_colour}%~%f%b"
}

prompt_path_git() {
    echo "$(prompt_path_git_root)$(prompt_path_git_path)"
}

prompt_path_git_root() {
    # recolouring based on unstaged/staged/clean is too slow
    local repo=$(basename $(git config --get remote.origin.url))
    local branch=$(git rev-parse --abbrev-ref HEAD)
    echo "%B%F{$prompt_git_colour}${repo%.git} -< $branch%f%b"
}

prompt_path_git_path() {
    if [[ $prompt_git_path_relative == true ]]; then
        local dir=$(git rev-parse --show-prefix)
        if [[ -n $dir ]]; then
            echo "$(prompt_join)%B%F{$prompt_path_colour}${dir%/}%f%b"
        fi
    else
        echo "$(prompt_join)$(prompt_path_full)"
    fi
}

PROMPT='$(prompt)'
