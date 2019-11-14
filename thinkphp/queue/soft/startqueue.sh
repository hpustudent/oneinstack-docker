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

echo "start..."

nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue registJichaQueue --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue updateUser --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue roomStatus --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue closeClass --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue addFans --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue envelopeBack --daemon >/dev/null 2>&1 &

nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue updateTran --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue groupInit --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue updateAvatar --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue inviteJoin --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue sendNotice --daemon >/dev/null 2>&1 &

nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue updateGroupPicture --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue getClassMsgHistory --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue checkClassUser --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue regjg --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue sendMsg --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue ClassroomStatus --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue closeClassroom --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue checkClassUser --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue classBillingInfo --daemon >/dev/null 2>&1 &

nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue SetForbiden --daemon >/dev/null 2>&1 &
nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:work --queue addFriend --daemon >/dev/null 2>&1 &

nohup /usr/local/php/bin/php /data/wwwroot/default/think queue:amqp --queue SaveUserResponse --daemon >/dev/null 2>&1 &

endDate=`date +"%Y-%m-%d %H:%M:%S"`
echo "startall-$endDate"
