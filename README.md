#Dropbox_Send_Forms

A rails app that uses 'dropbox-sdk', 'wicked_pdf', and 'wkhtmltopdf' to upload pdfs of forms to a Dropbox
account.

I had a client who wanted a website integrated with Dropbox so that an application form submitted by a user
would be uploaded to the client's Dropbox account. The dropbox-sdk gem enables this function, but there
was the issue of what kind of file to send. I thought pdfs would be ideal, so I brought in 'wicked_pdf' and
'wkhtmltopdf' to make pdf copies of the forms before sending them to Dropbox.

#Installation

1. git clone https://github.com/wstevo4891/Dropbox_Send_Forms.git

2. Run bundle install

3. rake db:migrate

4. run a rails server and visit the homepage at localhost:3000

#Getting Started

To make this app work, you need to make an app in a Dropbox account for receiving files and paste
some secret keys in the Dropbox initializer file.

Step 1. Get a Dropbox account.

Step 2. Got one? Good, now go to https://www.dropbox.com/developers and sign in if needed.

Step 3. Click on "Create your app" in the middle of the page below the picture.

Step 4. Choose "Dropbox API" and "App folder". Name your app, and click on "Create App"

Step 5. On this page, you will see "App Key" and "App Secret" on the row below "App folder name". 
Click on "show" to see the "App secret", now copy these keys and paste them on the appropriate lines
in config/initializers/dropbox_config.rb

Step 6. Below "App Key" and "App Secret" you will see the "Oauth2" row. At the bottom of this row is
"Generated Access token" and a "Generate" button beneath. Click on "Generate", copy the key, and
paste it between the quotes on the OAUTH2_ACCESS_TOKEN line in dropbox_config.rb

You're all set!  Go to the app's home page, create a user account, and complete the application form. 
You should see that a pdf of the form was uploaded to the Dropbox app you just created. A pdf file 
will also appear in the 'pdfs' folder in the root directory.

#More Info

There are a LOT of options you can use with the pdf files. I would recommend taking a look at the
README for 'wicked_pdf' here: https://github.com/mileszs/wicked_pdf

Compare the examples there with what I did in the documents controller, and you should get an idea of
how it all works!

Also look up 'wkhtmltopdf' for rails for more information on that gem. I use the 'wkhtmltopdf-binary' gem
in this app, (the important file is in the /bin directory) but there are plugins and other projects available.
