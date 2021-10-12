#!/bin/bash
echo "Levelhard1" > /dsv/shellscript/password
sshpass -f password ssh -o StrictHostKeyChecking=no kelsey@localhost 'date'
rm /dsv/shellscript/password
