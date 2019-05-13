#!/bin/bash
virtual_pid=`ps aux | grep -i virtualbox | awk '{print $2}'`

arr=(${virtual_pid})

echo "杀死virtualbox僵尸进程"
for i in ${arr[@]}
do
	kill -9 $i
done
echo "杀死完成"
