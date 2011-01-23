About
=====
Rails template to setup a new Rails 3 app to use the new jQuery drivers instead of the default prototype ones.

How to Use - New Project
========================
`rails new <appname> -m <path/to/jquery.rb>`

So, for example, if you make download this template in `~/Sites`:<br>
`rails new <appname> -m ~/Sites/jquery.rb`

Otherwise, you can run it directly from github like so:<br>
`rails new <appname> -m https://github.com/lleger/Rails-3-jQuery/raw/master/jquery.rb`

This template also makes a new javascript expansion, :cdn, for use in the javascript_include_tag that pulls jquery.min.js from Google's cache. For example:<br>
`<% javascript_include_tag :cdn %>`

How to Use - Existing Project
=============================
If you're converting a Rails 3 app to jQuery, you can use
`rake rails:template` to execute the template inside your existing app.

`rake rails:template LOCATION=https://github.com/lleger/Rails-3-jQuery/raw/master/jquery.rb`

How to Update
=============
The template creates a new rakefile called `jquery.rb` in `lib/tasks` that includes a rake tast `jquery:update` to update the jQuery js and Rails drivers js files. To use, simply run the following command:

`rake jquery:update`

The rake task will automatically download both js files and overwrite those in `public/javascripts`.

Process
=======
This template works via this process:

1.  Remove old prototype js
2.  Download latest jQuery min and place into javascripts folder
3.  Download latest jQuery drivers and place into javascripts folder
4.  Create requested javascript expansions

License
=======
You are free to make any and all modifications to the template and use it in whatever appropriate context you desire, as long as you keep the attributions in place.

Pull Requests
=============
I'm sure there are a lot of ways this can be done better, so if you make changes please send me a pull request.
