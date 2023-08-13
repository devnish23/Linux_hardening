#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install jffs2 /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload jffs2 module:rmmod jffs2`rmmod jffs2`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install jffs2 /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install jffs2 /bin/true]"; 
           echo "Unload jffs2 module:rmmod jffs2`rmmod jffs2`";
fi
