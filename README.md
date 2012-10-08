Script for animated wallpapers
==============================

Little script making the XML file for the animated wallpapers on Ubuntu.

Usage :

{% highlight bash %}
	./make_animated_wallpapers.sh directory duration_image duration_transition output_file
{% endhighlight %}

After the execution, you must send the XML output file in /usr/share/backgrounds/ then you 
must make another XML file in /usr/share/gnome-background-properties/ like this :

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
  <wallpaper deleted="false">
    <name>Name of wallpaper</name>
    <filename>/usr/share/backgrounds/Name_Of_XML_File.xml</filename>
    <options>zoom</options>
  </wallpaper>
</wallpapers>
{% endhighlight %}

This operation could depend of the Linux distribution and/or configuration but it works with Ubuntu 12.04 with Gnome Classic.
