if [[ $(mount| grep /var/tmp | wc -c) -eq 0 ]]; 
	then 
	   echo "No seperate /var/tmp FileSystem"; echo "Create Seperate /var/tmp Filesystem:"; 
        else 
           echo "/var/tmp Seperate Filesystem Exist"; 
fi
