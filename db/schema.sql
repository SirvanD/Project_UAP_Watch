CREATE DATABASE project2;

CREATE TABLE images (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    location TEXT,
    sighting_number TEXT,
    date TEXT,
    likes integer,
    dislikes integer,
    user_id integer
)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password_digest TEXT

)

INSERT INTO images (name, image_url,location,sighting_number,date) VALUES ('floating saucer','https://nypost.com/wp-content/uploads/sites/2/2017/09/170913-ufo-reward-1.jpg','Wollogong,New South Wales','4','August 24th 2019');


INSERT INTO images (name, image_url,location,sighting_number,date) VALUES ('metal disk object','https://s.hdnux.com/photos/61/36/64/12971324/9/1200x0.jpg','Melbourne,Australia','250','January 6th 1975');


