cd Deploy && cp sample_config.env .env && ls && screen -S Deploy
trap 'exit()'
timeout --preserve-status 19500 bash termux_install.sh &
pid=$!
wait $pid
if [ $? -eq 143 ]; then
    exit 0
else
    exit 1
fi
