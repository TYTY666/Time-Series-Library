#!/bin/bash

path=$1
log_path="./log/"$(date "+%Y-%m-%d-%H-%M-%S")

mkdir $log_path

files=$(ls $path)
for filename in $files
do
   bash $1$filename > $log_path"/"$filename".log"
done

