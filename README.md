Ionic Box
=============================

Ionic Box is a ready-to-go hybrid deveopment environment for building mobile apps with Ionic, Cordova, and Android. Ionic Box was built to make it easier for developers to build Android versions of their app, and especially for Windows users to get a complete dev environment set up without all the headaches.

For iOS developers, Ionic Box won't do much for you right now unless you are having trouble installing the Android SDK, and Ionic Box cannot be used for iOS development for a variety of legal reasons (however, the `ionic package` command in beta will soon fix that).

### Pre-installation

To install, download and install [Vagrant](https://www.vagrantup.com/downloads.html) for your platform, then download and install [VirtualBox](http://virtualbox.org/).

### Startup
	$ git clone https://github.com/benjick/ionic-box
	$ cd ionic-box
	$ vagrant up

The username for vagrant is `vagrant` and the password is `vagrant`. 

This will download and install the image, and then go through the dependencies and install them one by one. `vagrant ssh` will connect you to the image and give you a bash prompt. Once everything completes, you'll have a working box to build your apps on Android.

### Connected Android Devices

The image also has support for connected USB Android devices. To test whether devices are connected, you can run (from the box):

	$ adb-devices

If that does not work, or shows `????? permissions`, then run:

	$ adb-restart

### Create a project
	$ vagrant ssh
	$ ionic start amazeApp sidemenu
	$ cd amazeApp
	$ ionic platform add android
	$ ionic run android

See http://ionicframework.com/getting-started/ for available starter templates

### Ionic Serve
	$ cd amazeApp
	$ ionic serve
Pick the eth0-connection, no localhost. Point your browser to http://localhost:8100/ and you're set.


### Errors

###### ERROR : No emulator images (avds) found
Run `adb-restart` and make sure USB debugging is allowed on your phone

###### Error: ANDROID_HOME is not set and "android" command not in your PATH.
run `source ~/.bashrc` to load PATHs if this failed
