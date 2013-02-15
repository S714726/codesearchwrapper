# Completes workspace names for codesearchwrapper
# Put this in /etc/bash_completion.d/, source it from bashrc, etc.

_codesearch() {
    COMPREPLY=()
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    if [ $COMP_CWORD -eq 1 ] && [ -d "$HOME/.csearchindex" ]; then
        COMPREPLY=( $(compgen -W "$(ls -1 $HOME/.csearchindex/)" -- $cur) )
        return 0
    fi
    if [ "$COMP_WORDS" == "cindex" ] && [ $COMP_CWORD -ne 1 ]; then
        _filedir -d
        return 0
    fi
    return 0
}
complete -F _codesearch csearch
complete -F _codesearch cindex
