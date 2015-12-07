#Griffen

A demo-site for a local start-up and my largest project of 2015.

The client wanted the site integrated with the Dropbox and Zoho API's and this project
shows how to accomplish that functionality. When a user completes one of the three application forms, 
a pdf copy is sent to the Dropbox account specified in the dropbox.rb initializer. Likewise, when a 
user registers an account, the contact info is inserted as a "lead" in the initialized Zoho CRM account.

#Installation

1. git clone

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

Step 7. Register a Zoho CRM account and paste your api key between the quotes in config/initializers/zoho.rb

You're all set!  New users will appear as leads in your Zoho CRM account and completed application forms will 
be saved as pdfs in the 'pdfs' directory before being uploaded to your Dropbox App.

#More Info

There are a LOT of options you can use with the pdf files. I would recommend taking a look at the
README for 'wicked_pdf' here: https://github.com/mileszs/wicked_pdf

Compare the examples there with what I did in the documents controller, and you should get an idea of
how it all works!

Also look up 'wkhtmltopdf' for rails for more information on that gem. I use the 'wkhtmltopdf-binary' gem
in this app, (the important file is in the /bin directory) but there are plugins and other projects available.
