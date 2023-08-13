#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install squashfs /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload squashfs module:rmmod squashfs`rmmod squashfs`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install squashfs /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install squashfs /bin/true]"; 
           echo "Unload squashfs module:rmmod squashfs`rmmod squashfs`";
fi
