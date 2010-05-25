# This template installs the new jQuery drivers, removes
# the old prototype drivers, and installs an initializer
# which overrides the javascript_include_tag to include
# jQuery and the new drivers with :default
# Written by: Logan Leger, logan@loganleger.com
# http://github.com/lleger/Rails-3-jQuery

# Downloading latest jQuery.min
run "curl -L http://code.jquery.com/jquery-latest.min.js > public/javascripts/jquery.js"

# Downloading latest jQuery drivers
run "curl -L http://github.com/rails/jquery-ujs/raw/master/src/rails.js > public/javascripts/rails.js"

# Deleting old prototype drivers
inside('public/javascripts') do
	run "rm -rf controls.js dragdrop.js effects.js prototype.js rails.js"
end

# Overriding javascript_include_tag to include new jQuery js
initializer 'jquery.rb', <<-CODE
# Switch the javascript_include_tag :defaults to use jQuery instead of
# the default prototype helpers.
# Credits: http://webtech.union.rpi.edu/blog/2010/02/21/jquery-and-rails-3/
if ActionView::Helpers::AssetTagHelper.const_defined?(:JAVASCRIPT_DEFAULT_SOURCES)
	ActionView::Helpers::AssetTagHelper.send(:remove_const, \"JAVASCRIPT_DEFAULT_SOURCES\")
end
ActionView::Helpers::AssetTagHelper::JAVASCRIPT_DEFAULT_SOURCES = ['jquery', 'rails']
ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
CODE