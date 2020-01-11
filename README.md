IMDB min Project


A small multiple class app with many to many relationships and inner joins, built with Ruby, PostgreSQL and pg.  Debugged with pry to the following specification:


the new IMDB should have:
Movies

title
genre
⭐️ Stars ⭐️

first name
last name
Castings

movie_id
star_id
fee
The app should be able to

handle CRUD actions for all three models
display all the stars for a particular movie
and display all the movies a particular star is cast in.
Extension
Add a budget to your movie model and create a method that will return the remaining budget once all a movie's star's fees have been taken into consideration!
