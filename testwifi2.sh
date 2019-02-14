#!/bin/bash
echo "" >> "logs $(date)"
licznik=0
while [ true ]
do
ping -c 1 -q 212.77.98.9 > /dev/null
if [[ $? -eq 0 ]]
then
licznik=$(($licznik+1))
echo "petla $licznik"
echo "ping do zewn ip odpowiada"
else
licznik=$(($licznik+1))
echo "petla $licznik"
echo "ping zewn ip nie odpowiada"
echo $(date) $licznik "ping zewn ip nie odpowiada" >> "logs $(date)"
fi
sleep 2
nslookup wp.pl > /dev/null
if [[ $? -eq 0 ]]
then
licznik=$(($licznik+1))
echo "petla $licznik"
echo "nslookup odpowiada"
else
licznik=$(($licznik+1))
echo "petla $licznik"
echo "nslookup nie odpowiada"
echo $(date) $licznik "nslookup nie odpowiada" >> "logs $(date)"
fi
sleep 2
ping -c 1 -q 192.168.0.1 > /dev/null
if [[ $? -eq 0 ]]
then
licznik=$(($licznik+1))
echo "petla $licznik"
echo "ping do bramy odpowiada"
else
licznik=$(($licznik+1))
echo "petla $licznik"
echo "ping do bramy nie odpowiada"
echo $(date) $licznik "ping do bramy nie odpowiada" >> "logs $(date)"
fi
sleep 2
done
