=== WordPress plugin boilerplate auto builder ===
Contributors: HwangC
Donate link: http://hwangc.com/
Tags: comments, spam
Requires at least: 3.9
Tested up to: 3.9
Stable tag: 4.3
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

WordPress-Plugin-Boilerplate Auto Builder

== Description ==

Change files and class names of the default plugin from https://github.com/hwangc/WordPress-Plugin-Boilerplate.git
I refered to the build code from hlashbrooke/WordPress-Plugin-Template(https://github.com/hwangc/WordPress-Plugin-Template/blob/master/build-plugin.sh)

== Installation ==

1. Copy/paste this builder in your wp-content/plugins folder
2. Do build! sh build-plugin.sh
3. Input the name your plugin
4. If you choose git init yes, it will clone WordPress-Plugin-Boilerplate from the url you input (ex: https://github.com/hwangc/WordPress-Plugin-Boilerplate.git).
5. Init git
6. Remove or keep your Grunt file
7. Create symbolic link

** if you already have cloned WordPress Plugin Boilerplate, clone this builder into WordPress-Plugin-Boilerplate and when you build the plugin, say 'no' to git init question.

== Changelog ==

= 0.5 =
* Init the builder