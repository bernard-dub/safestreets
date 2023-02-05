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
	* remaining todo : styling of login and links
* tagging
	* done via acts_as_taggable_on
	* can filter posters by clicking on a tag
	* estimated time : 1hr
* cookies for preventing vote from the same visitor
	* done via CookieStore
	* custom route for resetting cookies for testing purposes, needs logged in admin
	* no unlike button yet
	* estimated time : 2hrs
* voting via turbo
	* https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
