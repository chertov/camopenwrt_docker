root xmhdipc

set ipaddr 192.168.0.10; setenv serverip 192.168.0.3; setenv bootargs mem=192M console=ttyAMA0,115200; tftp 0x82000000 uImage-OpenWrt-HI35xx; bootm 0x82000000

ifconfig eth0 192.168.0.10 netmask 255.255.255.0 && route add default gw 192.168.0.2 && ping 192.168.0.3

cd /tmp && ./load3518e -a -sensor imx222
