function history_to_syslog {
declare command
remoteaddr="`who am i`"
pwd="`pwd`"
command=$(fc -ln -0)
if [ "$command" != "$old_command" ]; then
logger -p local3.notice -t bash -i ? "$USER : $remoteaddr" "|| PID=$$ || Command : $command || Directory : $pwd"
fi
old_command=$command
}
trap history_to_syslog DEBUG
