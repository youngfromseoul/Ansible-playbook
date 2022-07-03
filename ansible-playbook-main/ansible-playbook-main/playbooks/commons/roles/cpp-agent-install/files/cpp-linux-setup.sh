#!/bin/bash

# Linux Agent Download & Install Script
FILE_NAME=cpp-linux-setup.tar.gz
FILE_PATH=$HOME/$FILE_NAME
DOWNLOAD_URI=http://10.128.129.27:5465/web/agent/cpp-linux-setup.tar.gz/cpp-linux-setup.tar.gz
TARGET_FOLDER=$HOME/cpp-agent

echo "####### DownloadUrl :$DOWNLOAD_URI #######"
echo "####### filePath : $FILE_PATH #######"

STATUS=$(curl -k -o $FILE_PATH -w '%{http_code}' $DOWNLOAD_URI)

if [ $STATUS -eq 200 ]; then
     echo "File Download Complete"
      if [ -e $FILE_PATH ]; then
          if [ ! -d $TARGET_FOLDER/$FILE_NAME ]; then
            mkdir -p $TARGET_FOLDER/$FILE_NAME
            tar -xvf $FILE_PATH -C $TARGET_FOLDER/$FILE_NAME
          fi

          cd $TARGET_FOLDER/$FILE_NAME
          ./ahnagent-install.sh
      else
          echo "$FILE_PATH install Fail!"
     fi
else
     echo "File Download Fail Status Code : $STATUS"
fi

exit $?
