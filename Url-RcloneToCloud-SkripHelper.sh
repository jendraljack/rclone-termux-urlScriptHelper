#!/system/bin/sh
curd="$(dirname $(realpath $0))"
jalursh="$(dirname $(readlink /proc/$$/exe))"
echo $jalursh > $curd/currentshell
if [ -z "$(cat $curd/currentshell|grep termux)" ]
then
echo "Skrip ini khusus terminal termux"
kill -9 $$
fi

if [ ! -f "$jalursh/busybox" ]
then
echo "### Silahkan pasang busybox, ketik: pkg install busybox"
kill -9 $$
fi
##
if [ ! -f "$jalursh/rclone" ]
then
busybox echo -e "\n### Silahkan pasang rclone\nketik:\npkg install rclone"
kill -9 $$
fi
busybox echo -e "\n#### folder saat ini: $curd\n#### Rclone url uploader ke cloud.\n#### Tunggu cepat...\n"

busybox echo -e "\n#### Pilih satu Cloud kamu di bawah ini untuk menyimpan berkasmu.\n"
rclone listremotes
read cloud
case $cloud in
"*");;
esac

busybox echo -n $cloud > $curd/cloud
busybox echo -e "\nInput url/link download langsung...\n"
read url
case $url in
"*");;
esac

busybox echo -n $url > $curd/url

#if [ ! -z "$2" ]
#then
#busybox echo -e "\nUsage: bash $(basename $0) fileDrive(no space)"
#sleep 2
#kill -9 $$
#fi

#busybox echo -n "$url" > $curd/linkcheck
if [ -z "$(cat $curd/url|grep http)" ]
then
busybox echo -e "\nInput protokol http\n"
kill -9 $$
fi

busybox echo -e "\nInput namaberkas(akan disimpan di root cloud)...\nbisa juga folderTersedia/namaberkas...\n"
read name
case $name in
"*");;
esac
#if [ ! -z "$2" ]
#then
#busybox echo -e "\nUsage: bash $(basename $0) fileDrive(no space)"
#sleep 2
#kill -9 $$
#fi
busybox echo -n $name > $curd/name
cloud="$(cat $curd/cloud)"
url="$(cat $curd/url)"
name="$(cat $curd/name)"

sleep 3
busybox echo -e "\nMembuat skrip\n#### Kamu akan upload $url ke cloud $cloud dengan nama $name....\n"
#rclone listremotes
sleep 4
busybox echo -e "#!$(readlink /proc/$$/exe)\nrclone copyurl \"$url\" \"$cloud:$name\" -vv" > $curd/02-$(basename $0)
$(readlink /proc/$$/exe) $curd/02-$(basename $0)
sleep 3
busybox echo -e "\ntransfer ke cloud $cloud selesai\nby blackskull script\n\n"

