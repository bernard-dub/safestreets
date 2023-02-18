# README

A simple Rails app to vote on some posters.

##features

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
	* estimated time : 2 hr

##todo

* render existing tags in update form, elegant editing of tags

* download poster in PDF
		
* suggest a slogan
	* minimal workflow processing :
		* let anyone submit a slogan
		* moderation via admin
		* admin can send a message to the submitter

* tech
	*remove _ds_store files from git repo :
		* https://stackoverflow.com/questions/107701/how-can-i-remove-ds-store-files-from-a-git-repository