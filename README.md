==============================
Script for animated wallpapers
==============================

Little script making the XML file for the animated wallpapers on Ubuntu.

Usage :
	./make_animated_wallpapers.sh directory duration_image duration_transition output_file

After the execution, you must send the XML output file in /usr/share/backgrounds/ then you 
must make another XML file in /usr/share/gnome-background-properties/ like this :

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
  <wallpaper deleted="false">
    <name>Name of wallpaper</name>
    <filename>/usr/share/backgrounds/Name_Of_XML_File.xml</filename>
    <options>zoom</options>
  </wallpaper>
</wallpapers>

This operation could depend of the Linux distribution and/or configuration but it works with Ubuntu 12.04 with Gnome Classic.


========================================================
Script for the conversion of a picture in another format
========================================================

It is a simple bash script which convert all files (a picture) in a given format to an other.
Synopsis :
	./convertall DIRECTORY_FROM DIRECTORY_TO EXTENSION_FROM EXTENSION_TO
