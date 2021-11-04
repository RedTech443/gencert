gencert
CSR and KEY certificate gen script.

This is a simple script that I made to help with day to day certificate request I get for some of the servers I work on for customers,
mostly this was for the Avaya SBC (Session Boarder Controller) CSR request to add multiple SANS to the CSR as the WEBGUI did not handle that well.

I am hardly a coder of any sort and I am sure there are many better ways to do this but I just do not know how. It may or may not help you.

Download the 2 files in this repo, edit the certificate.cnf to your liking and then run the gen.cer.sh file, it will ask a few questions and use openssl to create the certificates for you. Saves a bit of time with lots of certs.
