#!/bin/bash

# Jonathan Alexander Melendez Duran.
# Infrastructure Technology Manager
# soyjonnymelendez@gmail.com
# http://git.soyjonnymelendez.com
# Get source address of a TXID
# Release 1.0
#
#
# Updates:
#	
#	By Jonathan Melendez | Release 1.0
#	25/04/2023: Original  Code Retail to Production Service.
#
# Notes:
#	Only Execute with root user.
#
#	Important: Please fill the txid.txt file with all the hashes you want to identify.
#
# Starting Script

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

APIendpoint='https://api.blockcypher.com/v1/btc/main/txs/'

filename='txid.txt'
n=1
while read a;
do
# for read each line
echo "Identificando el TXID $a"
sleep 2
echo "En Proceso..."
curl -s $APIendpoint/$a >> response.json
sleep 2
echo "Json Generado del TXID $a"
echo "Transformando Data, por favor espere..."
sleep 2
echo 
cat response.json | jq -r '.inputs[].addresses' | cut -c 3- | head -2 | tail -1 >> addresses_origin.txt 
echo "Limpiando data..."
sleep 3
> response.json
n=$((n+1))
done < $filename
echo "Secuencia Completada"
sleep 3
echo "Fin del Script =)"
