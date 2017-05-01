#!/bin/bash
#Simple Shell Script to Automate Installation of Franz Messaging App
#Author :Franklin Antony
#Find Me On twitter @franklinrockz
#Scripted Based Upon the Notes by https://gist.github.com/jamiesoncj
cd
cd /opt/
mkdir franz
cd

printf  "\nDepending Upon Your System Please Choose 32bit or 64 bit"
printf  "\n(1)-- For 32 bit"
printf  "\n(2)-- For 64 bit"
printf  "\n(3)-- For Skipping the Download. Make Sure You have the downloaded file in Root Folder"
printf  "\nEnter Your Choice --> "
read  choice
if [[ $choice == 1 ]];
then
  printf  "Starting the Downloading Part.....\n"
  wget -c "https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-ia32-4.0.4.tgz"
  sudo tar -xf Franz-linux-ia32-4.0.4.tgz -C /opt/franz
elif [[ $choice == 2 ]];
 then
   printf  "Starting the Downloading Part.....\n"
   wget -c "https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz"
   sudo tar -xf Franz-linux-x64-4.0.4.tgz -C /opt/franz
else
  printf  "Skipping the Downloading Part.....\n"
  printf "Please Choose the Download version ...\n"
  printf  "\n(1)-- For 32 bit"
  printf  "\n(2)-- For 64 bit"
  read inner_choice
  if [[ $inner_choice == 1 ]];
  then
    sudo tar -xf Franz-linux-ia32-4.0.4.tgz -C /opt/franz
  elif [[ $inner_choice == 2 ]];
   then
    'File not Found.. Line 
    if [ ! -f /Franz-linux-x64-4.0.4.tgz ]; then
    echo "File not found!"
     fi'
     sudo tar -xf Franz-linux-x64-4.0.4.tgz -C /opt/franz
  else
    printf "Invalid Choice... We will be exiting"
    exit
  fi
fi

wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O franz-icon.png
sudo cp franz-icon.png /opt/franz
sudo touch /usr/share/applications/franz.desktop
cd /usr/share/applications/
echo "[Desktop Entry]">>franz.desktop
echo "Name=Franz" >>franz.desktop
echo "Comment=Franz App"  >>franz.desktop
echo "Exec=/opt/franz/Franz" >>franz.desktop
echo "Icon=/opt/franz/franz-icon.png" >>franz.desktop
echo "Terminal=false" >>franz.desktop
echo "Type=Application" >>franz.desktop
echo "Categories=Messaging,Internet" >>franz.desktop

clear
cd
cd /opt/franz/
./Franz
exit
