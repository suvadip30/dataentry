#/bin/usr

files='file.txt'


for file in $files
do
    cat $file | grep "Commercial Name (English)" | sed 's/Commercial Name (English)/\n/g'
done
