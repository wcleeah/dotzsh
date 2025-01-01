zmodload zsh/datetime
autoload -Uz add-zsh-hook

prompt_preexec() {
    prompt_prexec_realtime=${EPOCHREALTIME}
    echo "Command Starts: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
}

prompt_precmd() {
    echo ""
    echo "Command Ends: $(date '+%Y-%m-%d %H:%M:%S')"
    if (( prompt_prexec_realtime )); then
        local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
        local -rF s=$(( elapsed_realtime%60 ))
        local -ri elapsed_s=${elapsed_realtime}
        local -ri m=$(( (elapsed_s/60)%60 ))
        local -ri h=$(( elapsed_s/3600 ))
        if (( h > 0 )); then
            printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
        elif (( m > 0 )); then
            printf -v prompt_elapsed_time '%im%is' ${m} ${s}
        elif (( s >= 10 )); then
            printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
        elif (( s >= 1 )); then
            printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
        else
            printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
        fi
        unset prompt_prexec_realtime
    else
        # Clear previous result when hitting ENTER with no command to execute
        unset prompt_elapsed_time
    fi
}

add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd
RPS1='Previous Command Took %F{cyan}${prompt_elapsed_time}%F{none}'
