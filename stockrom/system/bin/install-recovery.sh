#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 25270272 4a73bc0d12ff7e230ec83ee064a8549c15bb7344 22136832 569528c1092b22b2028b428ccf44e65fa0b3c091
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:25270272:4a73bc0d12ff7e230ec83ee064a8549c15bb7344; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:22136832:569528c1092b22b2028b428ccf44e65fa0b3c091 EMMC:/dev/block/bootdevice/by-name/recovery 4a73bc0d12ff7e230ec83ee064a8549c15bb7344 25270272 569528c1092b22b2028b428ccf44e65fa0b3c091:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
