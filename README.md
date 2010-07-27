About
=====
Rails template to setup a new Rails 3 app to use the new jQuery drivers instead of the default prototype ones.  More information is available at: http://loganleger.com/rails-3-jquery.

As of Rails 3 RC, I can't seem to override the :defaults expansion, so instead I've created a :jquery one. If you dig around and find a better solution, please send me a pull request.

How to Use
==========
`rails -m <path/to/jquery.rb>`

So, for example, if you make this template in `~/Sites`:<br>
`rails -m ~/Sites/jquery.rb`

Process
=======
This template works via this process:

1.  Download latest jQuery min and place into javascripts folder
2.  Download latest jQuery drivers and place into javascripts folder
3.  Remove old prototype js
4.  <del>Overriding javascript_include_tag to include new jQuery js</del> As of the RC, the template now simply provides a :jquery expansion.

License
=======
You are free to make any and all modifications to the template and use it in whatever appropriate context you desire, as long as you keep the attributions in place.

Pull Requests
=============
I'm sure there are a lot of ways this can be done better, so if you make changes please send me a pull request.