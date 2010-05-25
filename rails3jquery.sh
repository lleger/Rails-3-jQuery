#! /bin/sh
APP_ROOT=`echo "$1" | sed -e "s/\/*$//" `

echo "`tput setaf 2` \nBegin Rails 3 jQuery setup in $APP_ROOT"
tput op

echo "`tput setaf 2` \n1. Updating jQuery"
tput op
cd ~/Sites/jquery/
git pull origin master
echo "`tput setaf 2` \n2. Making jQuery"
tput op
make min

echo "`tput setaf 2` \n3. Updating jQuery rails"
tput op
cd ~/Sites/jquery-ujs
git pull origin master
cd $APP_ROOT/public/javascripts

echo "`tput setaf 2` \n4. Removing prototype js"
tput op
rm -rf controls.js dragdrop.js effects.js prototype.js rails.js

echo "`tput setaf 2` \n5. Copying new jQuery js"
tput op
cp ~/Sites/jquery/dist/jquery.min.js $APP_ROOT/public/javascripts/jquery.js
cp ~/Sites/jquery-ujs/src/rails.js $APP_ROOT/public/javascripts

echo "`tput setaf 2` \n6. Overriding javascript_include_tag to include new jQuery js"
tput op
echo "# Switch the javascript_include_tag :defaults to use jQuery instead of
# the default prototype helpers.
# Credits: http://webtech.union.rpi.edu/blog/2010/02/21/jquery-and-rails-3/
if ActionView::Helpers::AssetTagHelper.const_defined?(:JAVASCRIPT_DEFAULT_SOURCES)
	ActionView::Helpers::AssetTagHelper.send(:remove_const, \"JAVASCRIPT_DEFAULT_SOURCES\")
end
ActionView::Helpers::AssetTagHelper::JAVASCRIPT_DEFAULT_SOURCES = ['jquery', 'rails']
ActionView::Helpers::AssetTagHelper::reset_javascript_include_default" > $APP_ROOT/config/initializers/jquery.rb

echo "`tput setaf 2` \n\nRails 3 jQuery setup complete.\nWritten by: Logan Leger, logan@loganleger.com\n"
tput op