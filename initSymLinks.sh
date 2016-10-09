#!/usr/bin/env bash
shopt -s dotglob
for filePath in ./*
do
	fileName=${filePath##*/}
	if [[ $fileName == .* ]]; then
		newFilePath="${HOME}/${fileName}"

		if [ -f $newFilePath ]; then 
			timeStr=`date +%s`
			echo "Moving ${newFilePath} to ${newFilePath}${timeStr}"
			mv ${newFilePath} "${newFilePath}${timeStr}"
		fi
		ln -sf "${PWD}/${fileName}" $newFilePath
	fi
done