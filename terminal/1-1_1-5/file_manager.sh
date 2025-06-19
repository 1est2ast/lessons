#!/bin/bash

if [[ $# -eq 0 ]];
then
echo "введите путь"
elif [[ $# -eq 1 ]];
then
 if [[ -d $1 ]];then
  
cd $1
pwd
fileCounter=0;
txtCount=0;
shCount=0;
emptyFoldersCount=0;
for file in *; 
do 

if [[ $fileCounter -lt 3 && $file == *txt ]]; then
fileCounter=$fileCounter+1
echo $file
else if [[ -f $file && -x $file ]]; then
valSize=$(wc -c < $file) 
echo "size of $file is $valSize bytes"
shCount=$((shCount+1))
else if [[ -d $file ]]; then
checkF=$(find $file -empty)
if [[ $checkF ]]; then
echo "Folder $checkF is empty"
emptyFoldersCount=$((emptyFoldersCount+1))
fi
fi
fi
fi
if [[ $file == *txt ]]; then
txtCount=$((txtCount+1))
fi
done;
echo "$txtCount txt files, $shCount sh files, $emptyFoldersCount empty folders"
else
 echo "$file is not directory"
 fi
else
echo "too much arguments"
fi

