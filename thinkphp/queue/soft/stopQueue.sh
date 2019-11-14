#!/bin/bash
echo "----------------------------------------------------------------------------"
# restart
SERVICE_NAME="think"
service_pid=`ps -ef | grep $SERVICE_NAME | grep -v grep | awk '{print $2}'`
echo "pid:$service_pid"

for id in $service_pid
do
kill -9 $id
echo "killed $id"
done
