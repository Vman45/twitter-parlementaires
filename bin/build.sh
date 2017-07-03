#!/bin/bash

cd $(echo $0 | sed 's#/[^/]*$##')/..

echo "Downloading..."
echo "--------------"
source /usr/local/bin/virtualenvwrapper.sh
workon twitter-parls
#./download_twitter.py "AssembleeNat" "les-députés"
./download_twitter.py "TwitterPolFR" "d-put-s-2017-22"
./download_twitter.py "Senat" "senateurs"
curl -sL "http://www.nosdeputes.fr/deputes/json" > .cache/deputes.json
curl -sL "http://www.nossenateurs.fr/senateurs/json" > .cache/senateurs.json

echo
echo "Associating..."
echo "--------------"
#./associate_twitter.py deputes .cache/twitter-AssembleeNat.json
./associate_twitter.py deputes .cache/twitter-TwitterPolFR.json
./associate_twitter.py senateurs .cache/twitter-Senat_Info.json
echo

