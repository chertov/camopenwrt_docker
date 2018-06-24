root xmhdipc

set ipaddr 192.168.0.10; setenv serverip 192.168.0.3; setenv bootargs mem=192M console=ttyAMA0,115200; tftp 0x82000000 uImage-OpenWrt-HI35xx; bootm 0x82000000

ifconfig eth0 192.168.0.10 netmask 255.255.255.0 && route add default gw 192.168.0.2 && ping 192.168.0.3

cd /tmp && ./load3518e -a -sensor imx222

# full dump 8Mb
set ipaddr 192.168.1.10; setenv serverip 192.168.1.3; sf probe 0; sf read 0x82000000 0x0 0x800000; tftp 0x82000000 ff_backup_8Mb.img 0x800000

# full dump 16Mb
set ipaddr 192.168.0.10; setenv serverip 192.168.0.3; sf probe 0; sf read 0x82000000 0x0 0x1000000; tftp 0x82000000 ff_backup_16Mb.img 0x1000000

set ipaddr 192.168.1.10; setenv serverip 192.168.1.3; setenv bootargs mem=37M console=ttyAMA0,115200; tftp 0x82000000 uImage-OpenWrt-HI35xx; bootm 0x82000000
