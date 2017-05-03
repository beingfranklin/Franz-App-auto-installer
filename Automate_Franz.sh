#!/bin/bash
#Simple Shell Script to Automate Installation of Franz Messaging App
#Author :Franklin Antony
#Find Me On twitter @franklinrockz
#Scripted Based Upon the Notes by https://gist.github.com/jamiesoncj

#Setting up variables based on package names
version="4.0.4"
franz32="Franz-linux-ia32-$version.tgz"
franz64="Franz-linux-x64-$version.tgz"

cd
cd /opt/
sudo mkdir franz
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
  sudo wget -c "https://github.com/meetfranz/franz-app/releases/download/$version/$franz32" -0 $franz32
  sudo tar -xf $franz32 -C /opt/franz
elif [[ $choice == 2 ]];
 then
   printf  "Starting the Downloading Part.....\n"
   sudo wget -c "https://github.com/meetfranz/franz-app/releases/download/$version/$franz64" -0 $franz64
   sudo tar -xf $franz64 -C /opt/franz
else
  printf  "Skipping the Downloading Part.....\n"
  printf "Please Choose the Download version ...\n"
  printf  "\n(1)-- For 32 bit"
  printf  "\n(2)-- For 64 bit"
  printf  "\nEnter Your Choice --> "
  read inner_choice
  if [[ $inner_choice == 1 ]];
  then
    'File not Found.. Line
    if [ ! -f /$franz64 ]; then
    echo "File not found!"
     fi'

    sudo tar -xf $franz32 -C /opt/franz
  elif [[ $inner_choice == 2 ]];
   then
    'File not Found.. Line
    if [ ! -f /$franz64 ]; then
    echo "File not found!"
     fi'
     sudo tar -xf $franz64 -C /opt/franz
  else
    printf "Invalid Choice... We will be exiting"
    exit
  fi
fi

#Setting Up Icon For Franz

sudo wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O franz-icon.png
sudo cp franz-icon.png /opt/franz

#Creating Desktop Entry
sudo touch /usr/share/applications/franz.desktop
cd /usr/share/applications/
sudo sh -c "echo "[Desktop\ Entry]" >>franz.desktop"
sudo sh -c  "echo "Name=Franz" >>franz.desktop"
sudo sh -c "echo "Comment=Franz\ App" >>franz.desktop"
sudo sh -c "echo "Exec=/opt/franz/Franz" >>franz.desktop"
sudo sh -c "echo "Icon=/opt/franz/franz-icon.png" >>franz.desktop"
sudo sh -c "echo "Terminal=false" >>franz.desktop"
sudo sh -c "echo "Type=Application" >>franz.desktop"
sudo sh -c " echo "Categories=Messaging,Internet" >>franz.desktop"

cd
printf "\nInstallation Complete :) "

# Cleaning Up Files
if [[ ($choice==1) && ($choice == 2) ]]; then
  printf "\nDo you want to Keep the Downloaded Files?(1 for Yes /0 for No)"
  printf "\nIt is Adviced to Keep those Files"
  read keep_files
  if [[ $keep_files == 0 ]]; then
    cd
    printf "\nCleaning Up as Requested...."
    cd
    sudo rm -r franz-icon.png
    if [[ $choice== 1 ]]; then
      sudo rm -r $franz32
    elif [[ $choice == 2 ]]; then
      sudo rm -r $franz64
    fi
  fi
fi
#Running Franz
cd /opt/franz/
./Franz
exit
