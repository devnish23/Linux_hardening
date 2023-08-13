#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install cramfs /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload cramfs module:rmmod cramfs`rmmod cramfs`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install cramfs /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install cramfs /bin/true]"; 
           echo "Unload cramfs module:rmmod cramfs`rmmod cramfs`";
fi
