#!/bin/bash
runTest=0

while getopts "tf:" arg; do
  case $arg in
    t) runTest=1;;
    f) folder=$OPTARG;;
  esac
done

createTestFolder () {
  echo "Creating test folder..."
  testFolder="testingFolder"
  rm -rf "./$testFolder"
  mkdir "./$testFolder"

  for i in $(seq 1 50);
  do
    thisIsATest="name name${i}_$RANDOM"
    mkdir "./$testFolder/$thisIsATest"
    touch "./$testFolder/$thisIsATest/test.txt"
  done
}

startCleanup () {
  cleanupFolder=$1
  echo "Beginning cleanup of folder: "$cleanupFolder"!"

  for fileDir in ./"$cleanupFolder"/* ; do  
    newFileDir=${fileDir%_*}
    echo Old folder name: $fileDir
    echo New folder name $newFileDir
    mv "$fileDir" "$newFileDir"
  done;
}

if [ $runTest -eq 1 ]
then
  createTestFolder
  startCleanup "testingFolder"
else
  startCleanup $folder
fi


