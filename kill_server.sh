#!/bin/bash

#################################################################################
#                                                                               #
#ps -ef | grep -v grep | grep rails | awk '{print $2}' | xargs kill -9          #
#netstat -aonp | grep 3000 | awk '{print $7}' | sed 's/\/.*//g' | xargs kill -9 #
#                                                                               #
#################################################################################

rails_server_pid=`ps -ef | grep -v grep | grep rails | awk '{print $2}'`

echo "=================================================="
echo $rails_server_pid
echo "=================================================="
echo "####            kill rails server             ####"
if [ -n "$rails_server_pid" ];then
  kill -9 $rails_server_pid
fi

occupied_port_pid=`netstat -aonp | grep 3000 | awk '{print $7}' | sed 's/\/.*//g'`

echo "###################################################"
echo $occupied_port_pid
echo "###################################################"
echo "####         release the occupied port         ####"
if [ -n "$occupied_port_pid" ];then
  kill -9 $occupied_port_pid
fi
