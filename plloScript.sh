

mainFolder="$1"

## ONLY FOR TESTING PURPOSES

mkdir "./$mainFolder"

for i in $(seq 1 50);
do
  thisIsATest="name name${i}_$RANDOM"
  mkdir "./$mainFolder/$thisIsATest"
  touch "./$mainFolder/$thisIsATest/test.txt"
done

echo Beginning cleanup of folder: "$mainFolder"!

## 1. Go to folder
## 2. Change 'testdir' to the folder name that contains all subfolders with files
## 3. Run this script: sh plloScript.sh
for fileDir in ./"$mainFolder"/* ; do  
  newFileDir=${fileDir%_*}
  echo Old folder name: $fileDir
  echo New folder name $newFileDir
  mv "$fileDir" "$newFileDir"
done;