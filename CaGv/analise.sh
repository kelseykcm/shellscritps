#!/bin/bash

echo "Alternativas"
echo "a - Escanear vulnerabilidades"
echo "b - Procurar por exploit"
echo "c - Fazer ataques DOS"
echo "d - Brute force de DNS"
echo "e - Verifica vulnerabilidade web"
echo "f - Discover rede"

echo "destino : "
read target

echo "porta :"
read port

echo "Digite a opcao : "
while :
do
	read resposta
	case $resposta in 
		a) echo
                       nmap -sV --script vulners $target
		       ;;
		b) echo
		       nmap -sS -sC -Pn --script vuln $target
		       ;;
		c) echo
		       nmap -Pn -sS -sC --script exploit $target
		       ;;
		d) echo
		       nmap -p 443 --script dns-brute.nse $target
		       ;;
		e) echo
		       nmap --script http-vuln-check $target -p $port --script-args="http.useragent='Mozilla/5.0 (compatible; ArcticFission)'"
		       ;;
	        f) echo
		       cp /dsv/shellscript/CaGv/discover.txt /dsv/shellscript/CaGv/discover-a.txt
		       nmap -sP $target > discover.txt
		       ;;
		*) echo 
	esac
done

#Verificar vulnerabilidades :
#nmap -sV -oX output.xml --script vulners $1
######nmap -sV --script vulners $1

#Verificar vulnerabilidades :
#####nmap -sS -sC -Pn --script vuln $1

#Verificar possiveis exploits :
######nmap -Pn -sS -sC --script exploit $1

#Faz ataques DOS
#######nmap -Pn -sS -sC --script dos $1 

#Faz ataques complestos de DOS :
######nmap --max-parallelism 750 -Pn --script http-slowloris --script-args http-slowloris.runforever=true $1

#Brute force de DNS : 
#####nmap -p 80 --script dns-brute.nse $1

#Checa vulnerabilidade web :
######nmap --script http-vuln-check localhost -p 80,443 --script-args="http.useragent='Mozilla/5.0 (compatible; ArcticFission)'"
