#!/bin/bash
set -x

# refer to 
# http://scrapy-chs.readthedocs.io/zh_CN/latest/intro/install.html#intro-install-platform-notes

path=`pwd`
lib="$path/lib"
scrapy_decompress_cmd="unzip"
scrapy_archive_name="scrapy-1.0.zip"
scrapy_file_name="scrapy-1.0"
scrapy_install_cmd="sudo python"

#install scrapy

cd $lib 
if [ ! -f $lib/$scrapy_archive_name ]; then
    echo "scrapy archive not exist"
    exit -1;
fi

if [ -d $lib/$scrapy_file_name ]; then
    rm -fR $lib/$scrapy_file_name
fi

`$scrapy_decompress_cmd $lib/$scrapy_archive_name -d $lib`

cd $lib/$scrapy_file_name
if [ ! -f "$lib/$scrapy_file_name/setup.py"]; then
    echo "not exist setup file for scrapy"
    exit -1
else
    cd $lib/$scrapy_file_name 
    $scrapy_install_cmd setup.py build 
    $scrapy_install_cmd setup.py install 
fi

exit 0
