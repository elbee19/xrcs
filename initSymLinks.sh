#!/usr/bin/env bash
shopt -s dotglob

#Since the script is based on getting filenames from the current directory, it should always be run from the directory containing it
cd "${0%/*}"

for filePath in ./*
do
	fileName=${filePath##*/}
	# Don't move the .git folder
	if [[ $fileName == .git ]]; then
		continue
	fi

	if [[ $fileName == .* ]]; then
		newFilePath="${HOME}/${fileName}"

		if [ -f $newFilePath ]; then 
			timeStr=`date +%s`
			echo "Moving ${newFilePath} to ${newFilePath}${timeStr}"
			mv ${newFilePath} "${newFilePath}${timeStr}"
		fi
		ln -sf "${PWD}/${fileName}" $newFilePath
	fi

	#TODO - Move the file moving logic to a function someday
	if [[ $fileName == ".bashrc" ]]; then
		newBashProfilePath="${HOME}/.bash_profile"

		if [ -f $newBashProfilePath ]; then 
			timeStr=`date +%s`
			echo "Moving ${newBashProfilePath} to ${newBashProfilePath}${timeStr}"
			mv ${newBashProfilePath} "${newBashProfilePath}${timeStr}"
		fi
		ln -sf "${PWD}/${fileName}" $newBashProfilePath
	fi

done