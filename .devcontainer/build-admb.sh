sudo apt-get update
wget https://github.com/admb-project/admb/releases/download/admb-13.1/admb-13.1-linux.zip
sudo unzip admb-13.1-linux.zip -d /usr/local/bin
sudo rm admb-13.1-linux.zip
sudo chmod 755 /usr/local/bin/admb-13.1/bin/admb
export PATH=$PATH:/usr/local/bin/admb-13.1/bin

echo 'options(repos = c(CRAN = \"https://cloud.r-project.org\"))'
sudo sh -c 'cat - >>\"${R_HOME}/etc/Rprofile.site\"'