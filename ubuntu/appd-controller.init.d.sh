#!/bin/bash

. /home/ubuntu/AppDynamics/appd-env.sh

################################################
# Do not edit below this line

start()
{
	nohup sudo -H -u $APPD_RUNTIME_USER $CONTROLLER_HOME/bin/controller.sh start > /dev/null 2>&1 &
}

stop()
{
	nohup sudo -H -u $APPD_RUNTIME_USER $CONTROLLER_HOME/bin/controller.sh start > /dev/null 2>&1 &
}

status ()
{
	STATUS=`ps -ef | grep -i glassfish |grep -v grep`
	if [ $? -eq 0 ];then
		echo "AppDynamics Controller app server is running"
	else
		echo "AppDynamics Controller app server is STOPPED"
	fi

	STATUS=`ps -ef|grep -i "db/bin/mysqld" |grep -v grep`
	if [ $? -eq 0 ];then
		echo "AppDynamics Controller database is running"
	else
		echo "AppDynamics Controller database is STOPPED"
	fi
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	status)
		status
		;;
	*)
		echo $"Usage: $0 {start|stop|restart|status}"
		exit 1
		;;
esac
