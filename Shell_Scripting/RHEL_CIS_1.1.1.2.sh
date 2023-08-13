#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install freevxfs /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload freevxfs module:rmmod freevxfs`rmmod freevxfs`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install freevxfs /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install freevxfs /bin/true]"; 
           echo "Unload freevxfs module:rmmod freevxfs`rmmod freevxfs`";
fi
