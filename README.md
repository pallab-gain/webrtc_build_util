### WebRTC_Utility
A simple shell script that download all java files from [webRTC master branch](https://chromium.googlesource.com/external/webrtc/) . 

#### Who needs it ?
If you need to modify/add/remove some functionality of libjingle_peerconnection.jar in your webRTC library.

#### Jobs
[download_org_webrtc_filesdownload_org_webrtc_files](https://github.com/pallab-gain/webrtc_build_util/blob/master/download_source.sh#L36)
* Based on current webRTC source directory download java files from three different urls for org.webrtc package. 

[download_videoengine_files](https://github.com/pallab-gain/webrtc_build_util/blob/master/download_source.sh#L70)
* Based on current webRTC source directory download java files for video engine package

[download_voiceengine_files](https://github.com/pallab-gain/webrtc_build_util/blob/master/download_source.sh#L85)
* Based on current webRTC source directory download java files for voice engine package

 
##### Screenshot

  ![libjingle_peerconnection.jar file tree ](/Selection_017.png?raw=true "File Tree")


