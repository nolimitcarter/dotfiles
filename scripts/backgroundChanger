#!/usr/bin/env bash

WP_DIR=~/Pictures/Wallpapers

cd $WP_DIR
while [ 1 ] 
do
	set -- *
	length=$#
	random_num=$((( $RANDOM % ($length) ) + 1))

	gsettings set org.gnome.desktop.background picture-uri "file://$WP_DIR/${!random_num}"

	sleep 600 
done 
