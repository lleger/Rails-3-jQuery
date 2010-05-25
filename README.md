About
=====
Rails template to setup a new Rails 3 app to use the new jQuery drivers instead of the default prototype ones.  More information is available at: http://loganleger.com/rails-3-jquery

How to Use
==========
`rails -m <path/to/jquery.rb>`

So, for example, if you make this template in `~/Sites`:<br>
`rails -m ~/Sites/jquery.rb`

Process
=======
1.  Download latest jQuery min and place into javascripts folder
2.  Download latest jQuery drivers and place into javascripts folder
3.  Remove old prototype js
4.  Overriding javascript_include_tag to include new jQuery js

License
=======
You are free to make any and all modifications to the template and use it in whatever appropriate context you desire, as long as you keep the attributions in place.

Pull Requests
=============
I'm sure there are a lot of ways this can be done better, so if you make changes please send me a pull request.

Bash
====
At first, I wrote this as a bash script, called `rails3jquery.sh`, which I've left here for posterity. You can read more about it in `README-bash.md`. However, less than six hours later I trashed this inefficient script for a Rails template, which is a much better system.