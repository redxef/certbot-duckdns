#!/usr/bin/env sh

pids=""

run_prog() {
    "$@" &
    pids="$! $pids"
}

trap_sig() {
    printf '%s' "$pids" | while IFS= read -r pid; do
        echo "pid=$pid"
        kill -s $1 $pid
    done
}

trap 'trap_sig TERM' SIGTERM

# echo "Updating duckdns record"
# duckdns

# echo "Acquiering letsencrypt certificates"
# certbot-duckdns "$@"

echo "Starting crond"
printf '*/5\t*\t*\t*\t*\trun-parts /etc/periodic/5min\n' >> /etc/crontabs/root
printf '*\t*/12\t*\t*\t*\trun-parts /etc/periodic/12h\n' >> /etc/crontabs/root
crontab -l

run_prog crond -l 0 -fc /etc/crontabs/
wait $pids
