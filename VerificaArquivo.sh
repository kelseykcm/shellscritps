#!/bin/bash
cd /dsv/shellscript
ARQ=teste*
if [ -f "$ARQ" ]; then
    echo "O arquivo existe"
    mv $ARQ /dsv/shellscript/teste
else
    echo "O arquivo não existe"
fi
