# final-project-sysbm

## How To Run
First, download all of the files into one directory, then use cd to go to the directory where you downloaded them.

You start off with an empty database. Seed it by typing: ```rake db:seed``` in your terminal. After this, you can run our program!

Type ```rails server``` and go to localhost:3000 in your broswer. From there, you can direct yourself around the site. To get maximum utility of the site, create an account with your student OSU email and log in!

# Functionality

## Buy
Logged in users can view the buy page and find books that match the criteria they want and email the user that has it for sale to buy it.

## Sell
Logged in users can create listings of their books they want to sell with an easy to use form for all the criteria. The listings will then be posted to the site where other users can see it. It will also show on your user profile to allow users to get easy access to their post. Once the book is bought, users can delete their listing.

## User Profile
Users have their own profiles that display their contact information (email) to users that are interested in buying their books. It also has the ability to allow users see their own listings for sale, if they needed to delete one after it was sold. Users can furthermore edit their name shown on their profile, and change their password if they wish.

## Admin View
Special view created for administrator accounts can delete user accounts.

## Bootstrap
Bootstrap framework gives the site a cohesive look and also allows user usage on mobile (web responsive).

## User Protection
Protect our users from dangerous others by only allowing users to sign up with their OSU account. Only allows logged in users to see the buy/sell page. Has a follower/following feature-- users with more followers are more trusted and have sold/bought more books to the community. Also, requires users to sign up with a complex email to protect their account. To read more about how we protect our users, see our presentation [slides](https://docs.google.com/presentation/d/13SV4jbKFbYaTxbrMFARRzJaMyY737J0y3MBWxCVn0pg/edit?usp=sharing)

## Cookies
Uses cookies to remember user's details between log in sessions but goes through many ways to try and protect the cookies. To read more about how we protect our users cookies, see our presentation [slides](https://docs.google.com/presentation/d/13SV4jbKFbYaTxbrMFARRzJaMyY737J0y3MBWxCVn0pg/edit?usp=sharing)

## Search
A complex search has been implemented that allows users to search by book name, class code, author, or ISBN. Users then can sort the results by price from low to high or high to low. The searches can be further filtered by searching for a specific condition.

