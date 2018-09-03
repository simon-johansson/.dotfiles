
if [ -z "$UPDATE_REMINDER_DAYS" ]; then
  UPDATE_REMINDER_DAYS=7
fi

if [ -z "$UPDATE_REMINDER_FILE" ]; then
  UPDATE_REMINDER_FILE='.update_everything_lastupdate'
fi

function check_interval() {
  now=$(date +%s)
  if [ -f ~/${1} ]; then
    last_update=$(cat ~/${1})
  else
    last_update=0
  fi
  interval=$(expr ${now} - ${last_update})
  echo ${interval}
}

day_seconds=$(expr 24 \* 60 \* 60)
update_seconds=$(expr ${day_seconds} \* ${UPDATE_REMINDER_DAYS})
last_update=$(check_interval ${UPDATE_REMINDER_FILE})

if [ ${last_update} -gt ${update_seconds} ]; then
  echo "It has been $(expr ${last_update} / $day_seconds) days since you updated your system"
  read -q "REPLY?Update Homebrew packages, ZSH plugins and Node? "
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      $(date +%s > ~/${UPDATE_REMINDER_FILE})
      update_everything
  fi
fi

# clean up after ourselves
unset UPDATE_REMINDER_DAYS
unset UPDATE_REMINDER_FILE
unset day_seconds
unset last_update
unset update_seconds
unset REPLY

unset -f check_interval
