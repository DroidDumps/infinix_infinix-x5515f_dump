#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:13824928:0ca0c7e41401344f62f56fb63acd1d978907194e; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:7758752:cddb5d2d1902f37191d29a30105968f478f8b080 EMMC:/dev/block/platform/bootdevice/by-name/recovery 0ca0c7e41401344f62f56fb63acd1d978907194e 13824928 cddb5d2d1902f37191d29a30105968f478f8b080:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
