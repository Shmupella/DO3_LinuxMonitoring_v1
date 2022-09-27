#!/bin/bash

myprint() {
    echo "Total number of folders (including all nested ones) = $(du $1| wc -l)"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):" 
    max1=$(du $1 | sort -n -r | awk 'NR == 2{print $2}')
    max2=$(du $1 | sort -n -r | awk 'NR == 3{print $2}')
    max3=$(du $1 | sort -n -r | awk 'NR == 4{print $2}')
    max4=$(du $1 | sort -n -r | awk 'NR == 5{print $2}')
    max5=$(du $1 | sort -n -r | awk 'NR == 6{print $2}')
    echo "1 - $max1, $(du -h -s $max1 | awk '{print $1}')"
    echo "2 - $max2, $(du -h -s $max2 | awk '{print $1}')"
    echo "3 - $max3, $(du -h -s $max3 | awk '{print $1}')"
    echo "4 - $max4, $(du -h -s $max4 | awk '{print $1}')"
    echo "5 - $max5, $(du -h -s $max5 | awk '{print $1}')"
    echo "Total number of files = $(find $1 -type f | wc -l)"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $(find $1 -name "*.conf" | wc -l)"
    echo "Text files = $(find $1 -name "*.txt" | wc -l)"
    find $1 -perm /a=x > result.txt #finding all files with ex perm
    echo "Executable files = $(file -f result.txt | sed -r s/'[^:]+:'/''/ | grep executable | wc -l)"
    rm result.txt
    echo "Log files (with the extension .log) = $(find $1 -name "*.log" | wc -l)"
    find $1 > result2.txt #finding all files in this directory
    echo "Archive files = $(file -f result2.txt | sed -r s/'[^:]+:'/''/ | grep archive | wc -l)"
    rm result2.txt
    echo "Symbolic links = $(find $1 -type l | wc -l)"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    echo "1 - $maxf1, (размер), (тип)"
    echo "2 - $maxf2, (размер), (тип)"
    echo "3 - $maxf3, (размер), (тип)"
    echo "4 - $maxf4, (размер), (тип)"
    echo "5 - $maxf5, (размер), (тип)"
    echo "6 - $maxf6, (размер), (тип)"
    echo "7 - $maxf7, (размер), (тип)"
    echo "8 - $maxf8, (размер), (тип)"
    echo "9 - $maxf9, (размер), (тип)"
    echo "10 - $maxf10, (размер), (тип)"
}

 

# 1 - /var/log/one/one.exe, 10 GB, exe  
# 2 - /var/log/two/two.log, 10 MB, log  
# etc up to 10  
# TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)  
# 1 - /var/log/one/one.exe, 10 GB, 3abb17b66815bc7946cefe727737d295  
# 2 - /var/log/two/two.exe, 9 MB, 53c8fdfcbb60cf8e1a1ee90601cc8fe2  
# etc up to 10  
# Script execution time (in seconds) = 1.5
