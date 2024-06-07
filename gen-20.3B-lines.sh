#!/bin/bash

B=203

for k in `seq 1 $B`
do
    for j in `seq 1 9`
    do
        for i in `seq 100 800`
        do
            # 一次4M,base64后*1.33=5.32M
            # 一个for循环700次,5.32*700=3724M,11660972行,约1200W行
            # 那么1亿行循环9次就够了,3724*9=33516M=32.7G
            # 203亿行循环203次就好了,33516*203=6803748M=6.5T
            dd if=/dev/urandom bs=4096 count=1024 | base64 -w $i
        done
        echo $j " 1200W done" 1>&2
        sleep 2
    done
    echo "$k " " 1亿 done" 1>&2
    sleep 5
done
