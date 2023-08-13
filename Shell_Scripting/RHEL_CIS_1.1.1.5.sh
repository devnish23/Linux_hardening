#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install hfsplus /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload hfsplus module:rmmod hfsplus`rmmod hfsplus`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install hfsplus /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install hfsplus /bin/true]"; 
           echo "Unload hfsplus module:rmmod hfsplus`rmmod hfsplus`";
fi
