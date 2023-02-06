# README

A simple Rails app to vote on some posters.

##todo
* authenticate for updating content
	* docs :
		* https://github.com/mikker/passwordless
		* https://entrision.com/blog/ruby-on-rails-authentication/
		* https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application
	* done via devise
	* estimated time : 3 hrs
	* remaining todo : styling of login and links, prevent free sign up and access content this way
* tagging
	* done via acts_as_taggable_on
	* can filter posters by clicking on a tag
	* estimated time : 1hr
	* remaining todo : render existing tags in update form, elegant editing
* cookies for preventing vote from the same visitor
	* docs :
		* done via CookieStore https://api.rubyonrails.org/v7.0.4.2/classes/ActionDispatch/Cookies.html
	* custom route for resetting cookies for testing purposes, needs logged in admin
	* estimated time : 2hrs
	* remaining todo : unlike button
* voting via turbo
	* docs :
		* https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams
* suggest a slogan
	* via turbo
	* minimal workflow processing