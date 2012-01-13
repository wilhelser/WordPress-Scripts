#!/bin/bash
 
# written by Wil Helser - http://wilhelser.com
#
# This script will make a dump of one WordPress database, change the URLs, and upload to the new database
 
 
 # Settings for source db ...
DB_NAME=
DB_USER=
DB_PASS=
DB_HOST=    #example.com
OLD_URL=     #example.local


# Settings for destination db ...
OUT_DB_NAME=
OUT_DB_USER=
OUT_DB_PASS=
OUT_DB_HOST=    #example.com
NEW_URL=  #example.com

# End of configuration

echo "making tmp directory..."

mkdir tmp;

echo "dumping database... "

mysqldump --add-drop-table  -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} > tmp/${DB_NAME}.sql;

echo "db dumped... updating urls..."

sed -i "s/${OLD_URL}/${NEW_URL}/g" tmp/${DB_NAME}.sql;

echo "urls updated from $OLD_URL to $NEW_URL ..."

echo "Do you want to upload to the new db now? ( y or n ): "
read UPLOAD 

if  [ $UPLOAD == 'y' ]; then 
    echo -n "uploading to the new DB..."
    mysql -h ${OUT_DB_HOST} -u ${OUT_DB_USER} -p${OUT_DB_PASS} ${OUT_DB_NAME}  < tmp/${DB_NAME}.sql;
    echo "That's a wrap homie!!!"
    rm -rf tmp 
    exit 1
fi 

if [ $UPLOAD == 'n' ]; then
    echo "Ok! Your file is in the tmp directory!"
    exit 2
fi

 