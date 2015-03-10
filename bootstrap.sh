#!/usr/bin/env bash

ANDROID_SDK_FILENAME=android-sdk_r24-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y nodejs nodejs-legacy npm git openjdk-7-jdk ant expect

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc
echo "alias adb-restart='sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server; sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server'" >> /home/vagrant/.bashrc
echo "alias adb-devices='sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices'" >> /home/vagrant/.bashrc
echo "alias vagrant='echo You are on the vagrant box'" >> /home/vagrant/.bashrc
echo "source /home/vagrant/.bashrc" >> /home/vagrant/.bash_profile

npm install -g cordova
npm install -g ionic
npm install -g bower
expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-21,build-tools-21.1.2
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices

echo "Welcome to ionic-box :)"
