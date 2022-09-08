# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 2.3.8

* Database creation: 
  * Create database using `rails db:create`
  * Migrate the files using `rails db:migrate`
  
* API Docs
  * `POST '/sign_up', params: { user: {fullname: user_name, email: user_email, password: user_password }}`
  Create to signup the user

  * `POST '/api/login', params: { user: { email: user_email, password: user_password }}`
    Login the user
    
  **NOTE: Below api's will require `Authorization` in request headers**

  * `GET '/users'`
    fetch all the users exists in the system

  * `GET '/users/search', params: { keyword: full_name_of_user }`
    Search user based on their full name

  * `POST '/users/:id/follow'`
    Send follow request based on their profile if user profile is public so it directly follow the user but if it is private so it create follow request

  * `DELETE '/users/:id/unfollow'`
    Send unfollow request based on their profile
   
  * `PUT '/users/:id/accept'`
    Accept the follow request of a user
    
   * `GET '/users/following_user_articles'`
     Fetch all the following user articles and their likes and comments
     
   * `GET '/users/list_of_folowing_or_followers'`
      Fetch all the following users and followers
    
    * `POST '/articles/:article_id/comments', params: { comment: { body: body_text } }`
      Create article comments

    * `POST '/comments/:comment_id/comments', params: { comment: { body: body_text } }`
      Create comments of comments
  
    * `POST '/articles/:article_id/likes'`
      Create article likes

    * `POST '/comments/:comment_id/likes'` 
      Create likes of comments
    
   

  
