#!/bin/bash

#Where files are located. It must be an absolute path (for the XML).
directory=$1

#Time duration of the image on the screen
duration_img=$2

#Time duration of the transition
duration_trans=$3

#The output XML file
output_file=$4

header="<background>\n
\t	<starttime>\n
\t\t	<year>2012</year>\n
\t\t	<month>01</month>\n
\t\t	<day>01</day>\n
\t\t	<hour>00</hour>\n
\t\t	<minute>00</minute>\n
\t\t	<second>00</second>\n
\t	</starttime>\n
	"
content=""
footer="\n</background>"

#First pass in order to fill an array. This array allows to create the transition tag. 
#I can not use something like files=($(ls *.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF} 2>/dev/null)) 
#because I want that the user can define the directory and thus, it does not work.
i=0
for file in $(ls $directory | grep .png) $(ls $directory | grep .jpg) $(ls $directory | grep .jpeg) $(ls $directory | grep .gif); do
	files[$i]=$file
	let "i++"
done

i=0
j=1
while [ $i -lt ${#files[@]} ]; do
	content=$content"
\t	<static>\n
\t\t	<duration>$duration_img</duration>\n
\t\t	<file>$directory/${files[$i]}</file>\n
\t	</static>\n
	"
	# If there is a next image
	if [ $j -lt ${#files[@]} ]; then
		content=$content"
\t	<transition>\n
\t\t	<duration>$duration_trans</duration>\n
\t\t	<from>$directory/${files[$i]}</from>\n
\t\t	<to>$directory/${files[$j]}</to>\n
\t	</transition>\n
		"
	else
		content=$content"
\t	<transition>\n
\t\t	<duration>$duration_trans</duration>\n
\t\t	<from>$directory/${files[$i]}</from>\n
\t\t	<to>$directory/${files[0]}</to>\n
\t	</transition>\n
		"
	fi
	
	let "i++"
	let "j++"
done

# After have construct the content, we add it in the wished output file.
echo -e $header$content$footer > $output_file
