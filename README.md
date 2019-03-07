Welcome to Masterpiece, a really lite version of Instagram or Deviantart.com for that
matter :) I am using the Sinatra framework to flesh out this project. With this application
you can upload your favorite artwork, sketches, even photographs to share with your friends and
family. I intended this application to be a sort of journal for artists so they can visually
see their artistic progression. It was a really fun project to embark on with a lot of challenges.

Here is how you can install Masterpiece:

# Masterpiece
1. First clone Masterpiece from Github
2. Change directory to Masterpiece
3. Run bundle install.
4. Run rake db:migrate
5. Run shotgun.
6. Restarting the database requires you to delete development.sqlite and schema.

Overview:

I used CRUD and MVC in building this application. Therefore the user can create, read(view),
update, or delete their work. Typically the basic controls one would like to have with an application. Building this app with Sinatra I used the Models, Views, Controllers paradigm to give the users the ability to login, logout and upload their work.
