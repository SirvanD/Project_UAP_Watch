CREATE DATABASE project2;

CREATE TABLE images (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    location TEXT,
    description TEXT,
    date TEXT,
    likes integer,
    dislikes integer,
    user_id integer,
    user_name TEXT,
    user_email TEXT,
    date_time timestamp,
    profile_url TEXT
)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password_digest TEXT,
    profile_url TEXT

)


CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER
);

CREATE TABLE dislikes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    content TEXT,
    user_id INTEGER,
    post_id INTEGER
);




INSERT INTO images (name, image_url,location,sighting_number,date) VALUES ('floating saucer','https://nypost.com/wp-content/uploads/sites/2/2017/09/170913-ufo-reward-1.jpg','Wollogong,New South Wales','4','August 24th 2019');


INSERT INTO images (name, image_url,location,description,date) VALUES ('metal disk object','https://s.hdnux.com/photos/61/36/64/12971324/9/1200x0.jpg','Melbourne,Australia','250','January 6th 1975');
INSERT INTO images (name, image_url,location,sighting_number,date) VALUES ('dome like object','https://images.ctfassets.net/rxqefefl3t5b/1086kPNgZ4dlbHydokavwb/ae6984ffe5c52318e04cec73d65ff868/virgin_20094558584.jpg','Virgina,USA','26','July 12th 1998');

INSERT INTO images (name, image_url,location,description,date) VALUES ('concept','https://images.immediate.co.uk/production/volatile/sites/4/2020/07/GettyImages-1201440704-2d920e6.jpg','Perth, Western Australia','9','December 17th 2015');


