# 1
sleep 10000&
pgrep -af "sleep 10000" && pkill -f "sleep 10000"

# 2
pidwait() {
    while kill -0 "$1" &>/dev/null
    do
        sleep 0.5
    done
}
