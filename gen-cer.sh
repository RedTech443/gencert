#!/bin/bash
##Created by Eric Swanson
while true; do
echo
echo
echo
    echo "WARNING -- Be sure to edit the certificate.cnf file before continuing"
    echo "This script will create a CSR and a KEY file with the parameters defined in the certificate.cnf file"
    echo 
    echo
    read -p "Do you wish to continue with this script?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo
echo
echo "####################################################"
echo "####### REMEMBER .KEY FILES ARE NOT TO BE SHARED ###"
echo "####################################################"
echo
echo
echo What shall we label these certificates? i.e sbc-certs
read label
echo Password for key file?
read password
if [ -z "$label" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"
    exit 99
fi
echo "Generating key request for $label"
#Generate a key
openssl genrsa -des3 -passout pass:$password -out $label.key 2048 -noout
#Remove passphrase from the key. Comment the line out to keep the passphrase
#echo "Removing passphrase from key"
#openssl rsa -in $label.key -passin pass:$password -out $label.key
#Create the request
echo "Creating CSR"
openssl req -new -key $label.key -out $label.csr -config certificate.cnf
#openssl req -new -key $label.key -out $label.csr -passin pass:$password \
#    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
echo "---------------------------"
echo "-----Below is your CSR-----"
echo "---------------------------"
echo
cat $label.csr
echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat $label.key
mkdir $label
mv $label.csr $label
mv $label.key $label
echo
echo
echo
echo "----$label.csr and $label.key have both been moved to the directory $label.----"
echo "----Remember to keep the $label.key in a safe location, do not share it with anyone!!----"
echo
read -p "Press Enter To Continue."
echo
echo
echo
