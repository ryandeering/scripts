#!/bin/sh
#

echo "Configuring proxy settings for IT Tallaght Computing Labs...\n\n"

sudo /bin/cp -rf ./cntlm/cntlm_proxy.conf /etc/cntlm.conf

echo "\n****************************************************************"
echo "*                                                                *"
echo "*       Proxy Settings enabled for IT Tallaght Computing Labs    *"
echo "*       Not suitable for college wifi or home use!!              *"
echo "*                                                                *"
echo "*       Open Firefox and authenticate Proxy if prompted          *"
echo "*       (computing\your_id and password)                         *"
echo "*                                                                *"
echo "*                                                                *"	
echo "********************************************  ********************\n\n"

echo "Restarting cntlm with new settings\n"

if ps ax | grep -v grep | grep "cntlm" > /dev/null
then
    sudo systemctl restart cntlm
else
    sudo systemctl start cntlm
fi

# Update desktop icons
/bin/cp -rf ./launchers/active/Status.desktop ~/Desktop/
/bin/cp -rf ./launchers/active/SetProxy.desktop ~/Desktop/

echo "Press any key to continue..."


