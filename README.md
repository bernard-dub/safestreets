# README

A simple Rails app to vote on some posters.

## done features

* authenticate for updating content
	* docs :
		* https://github.com/mikker/passwordless
		* https://entrision.com/blog/ruby-on-rails-authentication/
		* https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application
	* done via devise
	* styling of login, prevent free sign up and access content this way
	* estimated time : 4 hrs

* tagging
	* done via acts_as_taggable_on
	* can filter posters by clicking on a tag
	* estimated time : 1hr
	
* cookies for preventing vote from the same visitor
	* docs :
		* done via CookieStore https://api.rubyonrails.org/v7.0.4.2/classes/ActionDispatch/Cookies.html
	* custom route for resetting cookies for testing purposes, needs logged in admin
	* like/unlike toggle based on session cookie
	* estimated time : 2.5hrs

* voting via turbo
	* docs :
		* https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams
	* estimated time : 1hr
	
* suggest a slogan
	* via turbo
	* flowbite component to generate the modal :https://flowbite.com/docs/components/modal/
		* flowbite replaced by turbo/stimulus : https://www.youtube.com/watch?v=1QQ9j3z7NGw
	* minimal workflow processing :
		* let anyone submit a slogan
		* moderation via admin
		* admin can filter by status
	* estimated time : 6,5 hr

* download poster in PDF
	* estimated time : 0,5 hr
	
* voting buttons appear on hover of the pictures
	* https://www.w3schools.com/howto/howto_css_image_overlay_title.asp
	* estimated time : 0.5 hr

* tech
	* remove _ds_store files from git repo :
		* https://stackoverflow.com/questions/107701/how-can-i-remove-ds-store-files-from-a-git-repository
	* move db to postgresql
		* http://joshuapaling.com/blog/2013/08/06/dump-sqlite-database-in-rails.html
		* https://medium.com/geekculture/ruby-on-rails-switch-from-sqlite3-to-postgres-590009645c25
		* https://stackoverflow.com/questions/31079819/string-vs-text-using-rails-3-2-and-postgres-should-i-always-just-use-text
		* estimated time : 1 hr
	* upgrade to a heroku-compatible version of ruby
		* upgraded to 3.1.3 which is closest rbenv version compatible with 3.1.4
		* 3.2.2 not compatible with shipped version of nokogiri (needs under 3.2)
		* estimated time : 2 hr
	* uploaded images and files in heroku not kept after deploy
		* using bucketeer add-on
		* https://devcenter.heroku.com/articles/active-storage-on-heroku
		* estimated time : 1 hr
	
## todo features

* render existing tags in update form, elegant editing of tags

* render existing picture in update/create form, elegant editing of images
		
* suggest a slogan
	* admin can send a message to the submitter
	
* cookie consent banner : no need, see 
