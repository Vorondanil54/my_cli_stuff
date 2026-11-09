#=============== Utils Batch Commands ===============

ezals() {
    eza -l -F=always --color=always --color-scale=all --icons=always -a --group-directories-first -h --loc=lines -m --git --git-repos --no-user
}

#=============== Info Fetching ===============

# === Fastfetch ===
fastfetch --disable-linewrap

# === Today's Date ===
date

# === Oh My Posh ===
eval "$(oh-my-posh init bash)"

# === Onefetch ===
# git repository greeter
last_repository=
check_directory_for_new_repository() {
    current_repository=$(git rev-parse --show-toplevel 2> /dev/null)

    if [ "$current_repository" ] && \
       [ "$current_repository" != "$last_repository" ]; then
        onefetch --nerd-fonts --true-color always
    fi
    last_repository=$current_repository
}
cd() {
    builtin cd "$@"
    check_directory_for_new_repository
}

# optional, greet also when opening shell directly in repository directory
# adds time to startup
check_directory_for_new_repository
