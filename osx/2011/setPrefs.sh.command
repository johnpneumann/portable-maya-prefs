#!/bin/sh
# Script courtesy of John P. Neumann
# john@animateshmanimate.com

# Put in an error checking function
check_errs()
{
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    # make script exit with correct error code
    exit ${1}
  fi
}

# Now move to the /Volumes directory and list out all the available volumes for you
# to move to so the user can choose where to create their files
cd /Volumes
IFS='
'
array=(`ls`)

len=${#array[*]}

i=0
while [ $i -lt $len ]; do
echo "$i: ${array[$i]}"
let i++
done

# Here we finally prompt the user for the appropriate volume and move to the volume
echo "\n"
echo "Which drive is your prefsBackup folder located on?\n"
echo "*******************"
echo "IMPORTANT!!!"
echo "*******************"
echo "Use the name of the drive and hit enter (do not put the number)"
read drive

vol=$drive
cd $vol
check_errs $? "Drive ${1} not found on your system. Please try again"

# Check if directory exists. If it doesn't create it. If it does just move to it.
DIR=prefsBackup
if [ -d "$DIR" ] 
	then
		echo "prefsBackup directory already exists. Continuing happily..."
		sleep 2
		cd $DIR
	else
		echo "prefsBackup directory does not exist! Exiting"
		sleep 2
		exit;
fi

# Now begin normal file operations including diff'ing the files to make sure changes don't exist
echo "Copying prefs folder..."
cp -v -r ./2011-x64 ~/Library/Preferences/Autodesk/maya/
check_errs $? "File ${1} not found. Please contact john@animateshmanimate.com and report this error"
echo "Comparing prefs directory to original directory..."
diff -qr ./2011-x64/ ~/Library/Preferences/Autodesk/maya/2011-x64/
check_errs $? "Error finding file ${1}. Please contact john@animateshmanimate.com and report this error. If the error was about .ds_store files or other . files, it is safe to ignore."
echo "\n"
echo "*******************"
echo "New versions of this script can be downloaded from http://animateshmanimate.com"
echo "Any issues please email john@animateshmanimate.com with the details"
echo "This work is licensed under the 3-clause BSD (\"New BSD License\") license."
echo "Full license information can be attained at:"
echo "http://animateshmanimate.com/rigs_n_scripts/script-licensing/"
echo "*******************"