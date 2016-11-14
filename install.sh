#!/bin/bash
# Use only if you need to perform changes on the user system such as installing software
locale -a | grep $language >/dev/null 2>&1
[ $? -eq 0 ] && return

if dialog_yesno "Locale '$language' is not installed on your system, do you want to install it?" true >/dev/null; then
    dialog_msg "Make sure '$langauge.UTF-8' is checked. You don't need to make it the default locale for your system."
    sudo dpkg-reconfigure locales
fi
