# neighborhood_app
Sinatra app that allows users to follow posts from a specific neighborhood. 

Using Sinatra and Acitve Record a user can Sign Up/Log In to their account, create and/or follow specific neighborhoods, and create, edit, and delete posts associated with a given neighborhood. They can also read and comment posts created by other users and posted to the neighborhoods that they follow. 

Installation 

Clone this repository. 

User Ruby Gem bundler to install dependencies: 

gem install bundler 

Install required Ruby Gems: 

bundle install 

Use Rake to create sqlite3 database and required migratoins:

rake db:migrate 

Use Rake to add seed data:

rake db:seed 

Use Shotgun to start server:

shotgun 

Open a new tab in your browser: 

http://localhost:9393 

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. 

