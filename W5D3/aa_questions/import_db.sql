PRAGMA foreign_keys = ON;

/*REMEMBER THE SEMICOLON!!*/
/*NO TRAILING COMMAS!!*/

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;  
DROP TABLE IF EXISTS replies; 
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users; 


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255)
); 

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    subject INTEGER,
    parent_reply INTEGER,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (subject) REFERENCES questions(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    follower_id INTEGER NOT NULL, 

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    like_user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (like_user_id) REFERENCES users(id)
);

 

INSERT INTO /*specifies the order we will be supplying values in below*/
    users (fname, lname) 
VALUES /*,...; <- if you want to add more make sure you separate by commas and end list with semicolon*/
    ('Helen', 'Cheung'),
    ('Cody', 'Breene'),
    ('Sam', 'Walker'),
    ('Ronil', 'Bhatia'); 

INSERT INTO 
    questions (title, body, author_id) 
VALUES 
    ('Ruby', 'How do I make a hash?', 1),
    ('SQL', 'How do I join a table?', 2),
    ('JavaScript', 'How do I use the while loop for hashes?', 2);

INSERT INTO 
    replies (subject, parent_reply, body, author_id) 
VALUES 
    (1, NULL, 'Declare new variable with Hash.new(0)', 3),
    (2, NULL, 'Name your first table with FROM, then use JOIN before second table', 1),
    (2, 2, 'Don''t forget to nickname your two tables after declaring them, and using ON to specify which row', 4),
    (3, NULL, 'It''s similar to Ruby syntax, give it a try first then raise your question if you can''t figure it out', 3);

INSERT INTO
    question_likes (question_id, like_user_id)
VALUES
    (2, 1);

INSERT INTO
    question_follows (question_id, follower_id)
VALUES
    (2, 1),
    (1, 2),
    (3, 1);

