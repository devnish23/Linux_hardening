#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install vfat /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload vfat module:rmmod vfat`rmmod vfat`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install vfat /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install vfat /bin/true]"; 
           echo "Unload vfat module:rmmod vfat`rmmod vfat`";
fi
