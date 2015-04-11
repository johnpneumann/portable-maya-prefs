# Portable Maya Prefs

## What?
These scripts take your user preferences, including all of your scripts and shelves and either copies them to another drive or loads them from a drive you have them backed up to.

## Why?
While I was attending college I got tired of having to manually go into the folders and copy my preferences over every time that I sat at a computer at school. So I took 20 minutes out of my class time and wrote these scripts and have been using them ever since. Then I realized that while I was at home working on my Mac that I needed the same thing. So I rewrote it as a bash script for OSX.

## What version should I use?
Well, you should use the version of maya that you're going to use. :) If you move from computer to computer and work on multiple versions of maya, you can use the any_version of the script. This version allows the user to type in the version of maya that they're using and it retrieves or sets the preferences based on that input. While it should work for any version of maya, I have only tested it down to 2008 and up to 2011.  (*Note to windows users* I haven't had the chance to test it on a windows machine, so if it doesn't work file an issue. Also to note, if you're using the 64 bit version, you will need to specify the version with a -x64 at the end {eg. 2011-x64 or 2010-x64}.)

## Windows

### get_userPrefs.bat
This script retrieves your user preferences from the computer your working on. It uses the current user login to retrieve the scripts. When you run it, it will create a directory based on the version number of maya that you're using within the directory that you run the script from.

### set_userPrefs.bat
This script sets your user preferences from the directory that you run the script from (so make sure your preferences are backed up to the same location that you run this script from). When you run it, it will overwrite the preferences on the computer that you're on based on the current user login.

## OSX
### getPrefs.sh.command
This script retrieves your user preferences from the computer your working on. It uses the current user login to retrieve the scripts. When you run it, it will create a directory based on the version number of maya that you're using and create a directory called prefsBackup in the root of the drive that you specified.

### setPrefs.sh.command
This script sets your user preferences from the directory that you choose while the script is running. When you run it, it will overwrite the preferences on the computer that you're on based on the current user login.
