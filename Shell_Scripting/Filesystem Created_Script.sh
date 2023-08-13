echo ====================
echo Creating Filesystem
echo ====================

fdisk /dev/sdb << EOF
n
p
1


t
8e
w
EOF
echo ========================
echo Creating Physical Volume
echo ========================

pvcreate /dev/sdb1

echo ====================
echo Scan Physical Volume
echo ====================
pvs

echo ====================
echo Create Volume Group
echo ====================

vgcreate VGpa01 /dev/sdb1


echo ==================
echo Scan Volume Group
echo ==================

vgs

echo =======================
echo Creating Logical Volume
echo =======================

lvcreate --name LVapp --size 40G VGpa01

lvcreate --name LVlog --size 30G VGpa01

lvcreate --name LVbackup --size 29G VGpa01

echo ====================
echo Scan Logical Volume
echo ====================
lvs

echo =====================
echo Format Logical Volume
echo =====================

mkfs.ext3 -j /dev/VGpa01/LVapp

mkfs.ext3 -j /dev/VGpa01/LVlog

mkfs.ext3 -j /dev/VGpa01/LVbackup

echo =====================
echo Creating Mount Point
echo =====================

mkdir /app

mkdir /log

mkdir /backup

echo ===========================
echo Backup Fstab Before Editing
echo ===========================

cp -p /etc/fstab /etc/fstab_17Dec2014

cat /etc/fstab

echo ===========================================
echo Updating FSTAB Entries for Newly created FS
echo ===========================================

 echo "/dev/mapper/VGpa01-LVapp /app ext3 defaults,nodev   1 2" >>  /etc/fstab
 echo "/dev/mapper/VGpa01-LVlog /log ext3 defaults,nodev   1 2" >>  /etc/fstab
 echo "/dev/mapper/VGpa01-LVbackup /backup ext3 defaults,nodev   1 2" >>  /etc/fstab

echo ====================
echo Mount ALL Filesystem
echo ====================

mount -a

echo ============================
echo Check the Filesystem Mounted
echo ============================

df -h

echo ======================================
echo *****END OF SCRIPT FILESYSTEM CREATION
echo ======================================
