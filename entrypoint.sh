#!/bin/bash
cat `ls -tr /keys/*.pub` > /home/www/.ssh/authorized_keys
/etc/init.d/ssh start
apachectl -D FOREGROUND

