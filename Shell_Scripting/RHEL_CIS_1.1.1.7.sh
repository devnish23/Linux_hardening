#/bin/bash

if [ -f "/etc/modprobe.d/CIS.conf" ]; 
	then 
	   echo "File exist";  
           echo "install udf /bin/true" > /etc/modprobe.d/CIS.conf;
           echo "Setting Updated:"; 
           echo "`cat /etc/modprobe.d/CIS.conf`"; 
           echo "Unload udf module:rmmod udf`rmmod udf`"; 
        else 
           echo "File Doesnt Exist:"; 
           echo "File Created : `touch /etc/modprobe.d/CIS.conf`"; 
           echo "install udf /bin/true" > /etc/modprobe.d/CIS.conf; 
           echo "Setting Updated [install udf /bin/true]"; 
           echo "Unload udf module:rmmod udf`rmmod udf`";
fi
