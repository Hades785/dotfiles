# Loads all functions
for f in $(/usr/bin/ls -1 ${ZSH_DIR}/functions | grep "\.zsh$"); do
  _perf_timer_start "$f"
	source ${ZSH_DIR}/functions/$f
  _perf_timer_stop "$f"
done

