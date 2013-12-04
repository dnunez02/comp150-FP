#!/bin/bash

PROG=$1
TIME=$3
REPS=$2
FILE=$4

#rm -f test.txt
rm -f ${FILE}
for (( i=1; i<=$REPS; i++ ))
    do
    touch ${FILE}
    timeout 2h time -f %U -a -o ${FILE} ${PROG} +RTS -N4 -RTS 10 > /dev/null
    VAL=$?
    if [ "${VAL}" -eq "124" ]
    then echo "-1.0" >> ${FILE}
    fi
done