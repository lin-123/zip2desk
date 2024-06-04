echo $PWD/zip2desk.sh

chmod +x zip2desk.sh
sudo rm /usr/local/bin/zip2desk
sudo ln -s ${PWD}/zip2desk.sh /usr/local/bin/zip2desk