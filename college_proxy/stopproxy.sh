#!/bin/sh
#

echo "Configuring proxy settings for use outside IT Tallaght Computing Labs...\n\n"


sudo /bin/cp -rf ./cntlm/cntlm_noproxy.conf /etc/cntlm.conf

echo "\n*************************************************************************"
echo "*                                                                       *"
echo "*        Proxy settings configured college wifi or home use!!           *" 
echo "*                                                                       *"
echo "*                                                                       *"		
echo "*************************************************************************\n\n"


echo "Restarting cntlm with new settings\n"

if ps ax | grep -v grep | grep "cntlm" > /dev/null
then
   sudo systemctl restart cntlm
else
    sudo systemctl start cntlm
fi

# Update desktop icons
/bin/cp -rf ./launchers/Status.desktop ~/Desktop/
/bin/cp -rf ./launchers/SetProxy.desktop ~/Desktop/

echo "Press any key to continue..."


