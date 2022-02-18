#!/bin/sh

PRODUCT=`/bin/sh /bin/kobo_config.sh`;
[ $PRODUCT != trilogy ] && PREFIX=$PRODUCT-

i=0;
while true; do
        i=$((((i + 1)) % 6));
        zcat /etc/images/$PREFIX\update-spinner-$i.raw.gz | /usr/local/Kobo/pickel showpic 1;
        usleep 500000;
done 
