#!/bin/bash

my_array=$(ls | awk '/^.*\.mkv$/')

#换行符分割字符串
array=(${my_array//\n/ })  
for var in ${array[@]}
do
	file=$(find $var.mp4)
	if [ -z "$file" ]; then
	 $(ffmpeg -i $var -c copy -c:a aac -movflags +faststart $var.mp4)
	fi
done
