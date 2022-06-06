#!/bin/bash
for ip in `seq 1 255 `; do
	ping -c 2 $1.$ip
done
