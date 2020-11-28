#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:13822880:3305b7ed92777009f37dde37f6155705e96a9c25; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:7756704:dea94def4d01498a7a2b76744e9487c93738d771 EMMC:/dev/block/platform/bootdevice/by-name/recovery 3305b7ed92777009f37dde37f6155705e96a9c25 13822880 dea94def4d01498a7a2b76744e9487c93738d771:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
