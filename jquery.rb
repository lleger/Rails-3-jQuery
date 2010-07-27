# This template installs the new jQuery drivers, removes
# the old prototype drivers, and installs an initializer
# which provides a jquery javscript expansion
# and overrides the :defaults expansion
# Written by: Logan Leger, logan@loganleger.com
# http://github.com/lleger/Rails-3-jQuery

# Deleting old prototype drivers
# Do this first so that you don't delete the new jQuery rails one below
inside('public/javascripts') do
	run "rm -rf controls.js dragdrop.js effects.js prototype.js rails.js"
end

# Downloading latest jQuery.min
get "http://code.jquery.com/jquery-latest.min.js", "public/javascripts/jquery.js"

# Downloading latest jQuery drivers
get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

# Overriding default expansion
if yes?("Override :defaults and setup :jquery expansion?")
	initializer 'jquery.rb', <<-CODE
	# Switch the javascript_include_tag :defaults to
	# use jQuery instead of the default prototype helpers.
	# Also setup a :jquery expansion, just for good measure.
	# Written by: Logan Leger, logan@loganleger.com
	# http://github.com/lleger/Rails-3-jQuery

	ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ['jquery', 'rails']
	Rails.application.config.action_view.javascript_expansions[:defaults] = ['jquery', 'rails']
	CODE
elsif yes?("Override :defaults only?")
	initializer 'jquery.rb', <<-CODE
	# Switch the javascript_include_tag :defaults to
	# use jQuery instead of the default prototype helpers.
	# Written by: Logan Leger, logan@loganleger.com
	# http://github.com/lleger/Rails-3-jQuery

	Rails.application.config.action_view.javascript_expansions[:defaults] = ['jquery', 'rails']
	CODE
elsif yes?("Setup :jquery expansion only?")
	initializer 'jquery.rb', <<-CODE
	# Setup a :jquery expansion, just for good measure.
	# Written by: Logan Leger, logan@loganleger.com
	# http://github.com/lleger/Rails-3-jQuery

	ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ['jquery', 'rails']
	CODE
end