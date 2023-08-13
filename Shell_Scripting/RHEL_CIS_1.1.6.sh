if [[ $(mount| grep /var | wc -c) -eq 0 ]]; 
	then 
	   echo "No seperate /var FileSystem"; echo "Create Seperate /var Filesystem:"; 
        else 
           echo "/var Seperate Filesystem Exist"; 
fi
