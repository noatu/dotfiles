#!/usr/bin/env sh

makoctl reload
# to test a 'high' urgency notification add '-u critical '
notify-send -a "Test notif app" -i firefox -t 5000 "Here is some summary" "needed to <s>create</s> that script cuz /usr/bin/makoctl reload wasn't working and was preventing the notification to appear with no logs"
notify-send -a "Test notif app" -i firefox -t 5000 "1" "this is one"
notify-send -a "Test notif app" -i firefox -t 5000 "2" "this is two"
#notify-send -a "Test notif app" -i firefox -t 5000 "3" "this is three"
#notify-send -a "Test notif app" -i firefox -t 5000 "4" "this is four"
