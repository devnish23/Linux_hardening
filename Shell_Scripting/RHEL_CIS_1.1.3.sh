if [[ $(mount| grep /tmp | wc -c) -eq 0 ]]; 
	then 
	   echo "No Temp FileSystem"; echo "Create /tmp:"; 
           echo "Adding Options for /tmp Filesystem Before Creation"
           echo "Add [noexec,nodev,nosuid] to /etc/systemd/system/local-fs.target.wants/tmp.mount";
           cp -p /etc/systemd/system/local-fs.target.wants/tmp.mount /etc/systemd/system/local-fs.target.wants/tmp.mount.$(date +"%m_%d_%Y");
           grep -v Options /etc/systemd/system/local-fs.target.wants/tmp.mount > /etc/systemd/system/local-fs.target.wants/tmp.mount.temp;
           sed '/Type/a Options=mode=1777,strictatime,noexec,nodev,nosuid' /etc/systemd/system/local-fs.target.wants/tmp.mount.temp >> /etc/systemd/system/local-fs.target.wants/tmp.mount.temp1;
            cp -p /etc/systemd/system/local-fs.target.wants/tmp.mount.temp1 /etc/systemd/system/local-fs.target.wants/tmp.mount; echo "Setting Updated [Options=mode=1777,strictatime,noexec,nodev,nosuid]"
           cat /etc/systemd/system/local-fs.target.wants/tmp.mount
        else 
           echo "/tmp Filesystem Exist"; 
           echo "Enable systemd for /tmp mountpoint:[systemctl unmask tmp.mount] `systemctl unmask tmp.mount`"; 
           echo "Enable systemd for /tmp mountpoint:[systemctl enable tmp.mount] `systemctl enable tmp.mount`"; 
           echo "Add [noexec,nodev,nosuid] to /etc/systemd/system/local-fs.target.wants/tmp.mount"; 
           cp -p /etc/systemd/system/local-fs.target.wants/tmp.mount /etc/systemd/system/local-fs.target.wants/tmp.mount.$(date +"%m_%d_%Y");  
           grep -v Options /etc/systemd/system/local-fs.target.wants/tmp.mount > /etc/systemd/system/local-fs.target.wants/tmp.mount.temp; 
           sed '/Type/a Options=mode=1777,strictatime,noexec,nodev,nosuid' /etc/systemd/system/local-fs.target.wants/tmp.mount.temp >> /etc/systemd/system/local-fs.target.wants/tmp.mount.temp1; 
            cp -p /etc/systemd/system/local-fs.target.wants/tmp.mount.temp1 /etc/systemd/system/local-fs.target.wants/tmp.mount; echo "Setting Updated [Options=mode=1777,strictatime,noexec,nodev,nosuid]"
           cat /etc/systemd/system/local-fs.target.wants/tmp.mount
	   echo "Add nodev to tmp filesystem [mount -o remount,nodev /tmp]"
	   mount -o remount,nodev /tmp
fi
rm -rf /etc/systemd/system/local-fs.target.wants/tmp.mount.temp1 /etc/systemd/system/local-fs.target.wants/tmp.mount.temp
