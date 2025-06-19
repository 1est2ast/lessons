#!/bin/bash

echo "Введите имя: "

read name

mkdir $name

cd $name

touch welcome.txt

echo "Привет $name! Это твоя первая папка." >> welcome.txt
