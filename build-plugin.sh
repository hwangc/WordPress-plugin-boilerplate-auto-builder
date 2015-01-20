#!/bin/bash

#=========================================
#	User input
#=========================================

printf "Plugin name: "
read NAME

printf "Git Init (y/n): "
read GIT

if [ "$GIT" == "y" ]; then
	printf "Git URL: "
	read GITURL

	printf "Destination folder: "
	read FOLDER

	#=========================================
	#	Directory check
	#=========================================
	
	while [ -d "$FOLDER" ]; do
		printf "The folder already exists, please enter another folder name: "
		read FOLDER
	done

	printf "Initialise new git repo (y/n): "
	read NEWREPO

	printf "Include Grunt support (y/n): "
	read GRUNT
fi

#=========================================
#	Folder name validation
#=========================================
FOLDER=${FOLDER// /-}

#=========================================
#	Default Name
#=========================================

# Plugin Name
DEFAULT_NAME="Plugin Name"
# Plugin_Name
DEFAULT_CLASS=${DEFAULT_NAME// /_}
# plugin_name
DEFAULT_TOKEN=$( tr '[A-Z]' '[a-z]' <<< $DEFAULT_CLASS )
# plugin-name
DEFAULT_SLUG=${DEFAULT_TOKEN//_/-}

#=========================================
#	Custom Name
#=========================================

# Custom_Name
CLASS=${NAME// /_}
# custom_name
TOKEN=$( tr '[A-Z]' '[a-z]' <<< $CLASS)
# custom-name
SLUG=${TOKEN//_/-}

#=========================================
#	Git clone
#=========================================

if [ "$GIT" == "y" ]; then

echo "
#=========================================
#	Git clone ...
#========================================="

	git clone $GITURL $FOLDER

	# mkdir -p $FOLDER

	mv $FOLDER/$DEFAULT_SLUG/* ./$FOLDER

	cd $FOLDER

	rm -rf .git

	rm -rf $DEFAULT_SLUG


fi

#=========================================
#	Grunt execute
#=========================================

if [ "$GRUNT" == "n" ]; then
	
	echo "
	#=========================================
	#	Grunt remove ...
	#========================================="

	rm Gruntfile.js
	rm package.json
fi

#=========================================
#	Start file changes
#=========================================

echo "
#=========================================
#	Updating plugin files...
#========================================="

#=========================================
#	/trunk file(s)
#	plugin-name.php
#	readme.txt
#	uninstall.php
#=========================================

cd trunk

# plugin-name.php
mv $DEFAULT_SLUG.php $SLUG.php

cp $SLUG.php $SLUG.tmp
sed "s/WordPress Plugin Boilerplate/$NAME/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

# readme.txt
cp readme.txt readme.tmp
sed "s/$DEFAULT_NAME/$NAME/g" readme.tmp > readme.txt
rm readme.tmp

# uninstall.php
cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_NAME/$NAME/g" uninstall.tmp > uninstall.php
rm uninstall.tmp

cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" uninstall.tmp > uninstall.php
rm uninstall.tmp

cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" uninstall.tmp > uninstall.php
rm uninstall.tmp

cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" uninstall.tmp > uninstall.php
rm uninstall.tmp

#=========================================
#	/trunk/language file(s)
#	plugin-name.pot
#=========================================

cd languages

mv $DEFAULT_SLUG.pot $SLUG.pot

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_NAME/$NAME/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

#=========================================
#	/trunk/includes file(s)
#	class-plugin-name.php
#	class-plugin-name-loader.php
#	class-plugin-name-i18n.php
#	class-plugin-name-deactivator.php
#	class-plugin-name-activator.php
#=========================================

cd ../includes

#class main
mv class-$DEFAULT_SLUG.php class-$SLUG.php

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

#class loader
mv class-$DEFAULT_SLUG-loader.php class-$SLUG-loader.php

cp class-$SLUG-loader.php class-$SLUG-loader.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-loader.tmp > class-$SLUG-loader.php
rm class-$SLUG-loader.tmp

cp class-$SLUG-loader.php class-$SLUG-loader.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-loader.tmp > class-$SLUG-loader.php
rm class-$SLUG-loader.tmp

cp class-$SLUG-loader.php class-$SLUG-loader.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-loader.tmp > class-$SLUG-loader.php
rm class-$SLUG-loader.tmp

#class i18n
mv class-$DEFAULT_SLUG-i18n.php class-$SLUG-i18n.php

cp class-$SLUG-i18n.php class-$SLUG-i18n.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-i18n.tmp > class-$SLUG-i18n.php
rm class-$SLUG-i18n.tmp

cp class-$SLUG-i18n.php class-$SLUG-i18n.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-i18n.tmp > class-$SLUG-i18n.php
rm class-$SLUG-i18n.tmp

cp class-$SLUG-i18n.php class-$SLUG-i18n.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-i18n.tmp > class-$SLUG-i18n.php
rm class-$SLUG-i18n.tmp

#class deactivator
mv class-$DEFAULT_SLUG-deactivator.php class-$SLUG-deactivator.php

cp class-$SLUG-deactivator.php class-$SLUG-deactivator.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-deactivator.tmp > class-$SLUG-deactivator.php
rm class-$SLUG-deactivator.tmp

cp class-$SLUG-deactivator.php class-$SLUG-deactivator.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-deactivator.tmp > class-$SLUG-deactivator.php
rm class-$SLUG-deactivator.tmp

cp class-$SLUG-deactivator.php class-$SLUG-deactivator.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-deactivator.tmp > class-$SLUG-deactivator.php
rm class-$SLUG-deactivator.tmp

#class activator
mv class-$DEFAULT_SLUG-activator.php class-$SLUG-activator.php

cp class-$SLUG-activator.php class-$SLUG-activator.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-activator.tmp > class-$SLUG-activator.php
rm class-$SLUG-activator.tmp

cp class-$SLUG-activator.php class-$SLUG-activator.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-activator.tmp > class-$SLUG-activator.php
rm class-$SLUG-activator.tmp

cp class-$SLUG-activator.php class-$SLUG-activator.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-activator.tmp > class-$SLUG-activator.php
rm class-$SLUG-activator.tmp

#=========================================
#	/trunk/public file(s)
#	class-plugin-name-public.php
#=========================================

cd ../public

#class public
mv class-$DEFAULT_SLUG-public.php class-$SLUG-public.php

cp class-$SLUG-public.php class-$SLUG-public.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-public.tmp > class-$SLUG-public.php
rm class-$SLUG-public.tmp

cp class-$SLUG-public.php class-$SLUG-public.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-public.tmp > class-$SLUG-public.php
rm class-$SLUG-public.tmp

cp class-$SLUG-public.php class-$SLUG-public.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-public.tmp > class-$SLUG-public.php
rm class-$SLUG-public.tmp

#=========================================
#	/trunk/public/partials file(s)
#	plugin-name-public-display.php
#=========================================

cd partials

#class public/partials
mv $DEFAULT_SLUG-public-display.php $SLUG-public-display.php

cp $SLUG-public-display.php $SLUG-public-display.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-public-display.tmp > $SLUG-public-display.php
rm $SLUG-public-display.tmp

cp $SLUG-public-display.php $SLUG-public-display.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG-public-display.tmp > $SLUG-public-display.php
rm $SLUG-public-display.tmp

cp $SLUG-public-display.php $SLUG-public-display.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG-public-display.tmp > $SLUG-public-display.php
rm $SLUG-public-display.tmp

#=========================================
#	/trunk/public/js file(s)
#	plugin-name-public.js
#=========================================

cd ../js

#class public/js
mv $DEFAULT_SLUG-public.js $SLUG-public.js

cp $SLUG-public.js $SLUG-public.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-public.tmp > $SLUG-public.js
rm $SLUG-public.tmp

cp $SLUG-public.js $SLUG-public.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG-public.tmp > $SLUG-public.js
rm $SLUG-public.tmp

cp $SLUG-public.js $SLUG-public.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG-public.tmp > $SLUG-public.js
rm $SLUG-public.tmp

#=========================================
#	/trunk/public/css file(s)
#	plugin-name-public.css
#=========================================

cd ../css

#class public/css
mv $DEFAULT_SLUG-public.css $SLUG-public.css

cp $SLUG-public.css $SLUG-public.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-public.tmp > $SLUG-public.css
rm $SLUG-public.tmp

cp $SLUG-public.css $SLUG-public.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG-public.tmp > $SLUG-public.css
rm $SLUG-public.tmp

cp $SLUG-public.css $SLUG-public.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG-public.tmp > $SLUG-public.css
rm $SLUG-public.tmp

#=========================================
#	/trunk/admin file(s)
#	class-plugin-name-admin.php
#=========================================

cd ../../admin

#class admin
mv class-$DEFAULT_SLUG-admin.php class-$SLUG-admin.php

cp class-$SLUG-admin.php class-$SLUG-admin.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-admin.tmp > class-$SLUG-admin.php
rm class-$SLUG-admin.tmp

cp class-$SLUG-admin.php class-$SLUG-admin.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-admin.tmp > class-$SLUG-admin.php
rm class-$SLUG-admin.tmp

cp class-$SLUG-admin.php class-$SLUG-admin.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-admin.tmp > class-$SLUG-admin.php
rm class-$SLUG-admin.tmp

#=========================================
#	/trunk/admin/partials file(s)
#	plugin-name-admin-display.php
#=========================================

cd partials

#class admin/partials
mv $DEFAULT_SLUG-admin-display.php $SLUG-admin-display.php

cp $SLUG-admin-display.php $SLUG-admin-display.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-admin-display.tmp > $SLUG-admin-display.php
rm $SLUG-admin-display.tmp

cp $SLUG-admin-display.php $SLUG-admin-display.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG-admin-display.tmp > $SLUG-admin-display.php
rm $SLUG-admin-display.tmp

cp $SLUG-admin-display.php $SLUG-admin-display.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG-admin-display.tmp > $SLUG-admin-display.php
rm $SLUG-admin-display.tmp

#=========================================
#	/trunk/admin/js file(s)
#	plugin-name-admin.js
#=========================================

cd ../js

#class admin/js
mv $DEFAULT_SLUG-admin.js $SLUG-admin.js

cp $SLUG-admin.js $SLUG-admin.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-admin.tmp > $SLUG-admin.js
rm $SLUG-admin.tmp

cp $SLUG-admin.js $SLUG-admin.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG-admin.tmp > $SLUG-admin.js
rm $SLUG-admin.tmp

cp $SLUG-admin.js $SLUG-admin.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG-admin.tmp > $SLUG-admin.js
rm $SLUG-admin.tmp

#=========================================
#	/trunk/admin/css file(s)
#	plugin-name-admin.css
#=========================================

cd ../css

#class admin/css
mv $DEFAULT_SLUG-admin.css $SLUG-admin.css

cp $SLUG-admin.css $SLUG-admin.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-admin.tmp > $SLUG-admin.css
rm $SLUG-admin.tmp

cp $SLUG-admin.css $SLUG-admin.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG-admin.tmp > $SLUG-admin.css
rm $SLUG-admin.tmp

cp $SLUG-admin.css $SLUG-admin.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG-admin.tmp > $SLUG-admin.css
rm $SLUG-admin.tmp

#=========================================
#	Git Init
#=========================================

if [ "$NEWREPO" == "y" ]; then
	
echo "
#=========================================
#	Initialising new git repo...
#========================================="
	cd ../../../
	git init
fi

echo "
#=========================================
#	Creating a symbolic link...
#========================================="
ln -s $PWD/trunk ../$SLUG-sym

#=========================================
#	Finish!
#=========================================
echo "
#=========================================
#	Complete!
#========================================="