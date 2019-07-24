#/bin/usr
rm -rf data.txt
rm -rf data1.txt
rm -rf data2.txt
rm -rf data3.txt
rm -rf data4.txt
rm -rf data5.txt

files='file.txt'

for file in $files
do
    cat $file | grep "Commercial Name (English)" | sed 's/Commercial Name (English)/\n/g' >> data1.txt
    cat $file | grep "Flat / Shop No." -A 2 >> data.txt
    cat $file | grep "Email" | sed 's/Email/\n/g' >> data3.txt
    cat $file | grep "Mobile No." | sed 's/Mobile No./\n/g' | sed 's/Email.*//' >> data4.txt
    cat $file | grep "Phone No." | sed 's/Phone No./\n/g' >> data5.txt
done

sed -i '/^$/d; s/^[ \t]*//' data1.txt
awk '{printf $0 (NR%4?" ":"\n")}' data.txt > data2.txt
sed -i '/^$/d; s/^[ \t]*//; s/Mobile.*//' data3.txt
sed -i '/^$/d; s/^[ \t]*//' data4.txt
sed -i '/^$/d; s/^[ \t]*//; s/Fax.*//' data5.txt
