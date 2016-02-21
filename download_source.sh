#!/bin/bash


PREFIX='https://chromium.googlesource.com/external/webrtc/+archive'
#this will change to adjast all previous, future, and current commits
REVISION='fa830dcc28aedd8b6aab3a2b082c3a6edbdc0bb1'

DOWNLOAD_PATH=${PREFIX}/${REVISION}

PARENT_DIR='org.webrtc'

create_folder(){
	if [ ! -d $1 ]
		then
		mkdir -v -p $1
	fi
}

delete_folder(){
	if [ -f $1 ]
		then
		rm -v $1
	fi
}

extract_folder(){
	create_folder $2
	
	#--------------------------------------------------------------------------
	echo 'extracting files in '$2
	tar -zxf $1 -C $2
	echo 'completed.'
	#--------------------------------------------------------------------------
}

download_org_webrtc_files(){

	path_one=webrtc/api/java/android/org/webrtc.tar.gz
	path_two=webrtc/api/java/src/org/webrtc.tar.gz
	path_three=webrtc/base/java/src/org/webrtc.tar.gz

	name=${PARENT_DIR}


	#-------------------------------------------------------------------------
	echo 'downloading files from '${DOWNLOAD_PATH}/${path_one}
	wget ${DOWNLOAD_PATH}/${path_one} -O ${name}.1.tar.gz
	echo 'completed.'
	#-------------------------------------------------------------------------
	echo 'downloading files from '${DOWNLOAD_PATH}/${path_two}
	wget ${DOWNLOAD_PATH}/${path_two} -O ${name}.2.tar.gz
	echo 'completed.'
	#-------------------------------------------------------------------------

	#-------------------------------------------------------------------------
	echo 'downloading files from '${DOWNLOAD_PATH}/${path_three}
	wget ${DOWNLOAD_PATH}/${path_three} -O ${name}.3.tar.gz
	echo 'completed.'
	#-------------------------------------------------------------------------

	extract_folder ${name}.1.tar.gz ${name}
	extract_folder ${name}.2.tar.gz ${name}
	extract_folder ${name}.3.tar.gz ${name}


	delete_folder ${name}.1.tar.gz
	delete_folder ${name}.2.tar.gz
	delete_folder ${name}.3.tar.gz
}

download_videoengine_files(){
	path=webrtc/modules/video_render/android/java/src/org/webrtc/videoengine.tar.gz
	name='videoengine'

	#-------------------------------------------------------------------------
	echo 'downloading files from '${DOWNLOAD_PATH}/${path}
	wget ${DOWNLOAD_PATH}/${path} -O ${name}.tar.gz
	echo 'completed.'
	#-------------------------------------------------------------------------

	extract_folder ${name}.tar.gz ${PARENT_DIR}/${name}

	delete_folder ${name}.tar.gz 
}

download_voiceengine_files(){
	path=webrtc/modules/audio_device/android/java/src/org/webrtc/voiceengine.tar.gz
	name='voiceengine'

	#-------------------------------------------------------------------------
	echo 'downloading files from '${DOWNLOAD_PATH}/${path}
	wget ${DOWNLOAD_PATH}/${path} -O ${name}.tar.gz
	echo 'completed.'
	#-------------------------------------------------------------------------

	extract_folder ${name}.tar.gz ${PARENT_DIR}/${name}

	delete_folder ${name}.tar.gz 
}

clear
#download code
download_org_webrtc_files
#download video engine code
download_videoengine_files
#download voice engine code
download_voiceengine_files