#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install hfs /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload hfs module:rmmod hfs`rmmod hfs`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install hfs /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install hfs /bin/true]"; 
           echo "Unload hfs module:rmmod hfs`rmmod hfs`";
fi
