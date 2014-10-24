CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_followers (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body VARCHAR(255) NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id), -- can be null
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id) 
);

INSERT INTO
   users (fname, lname)
VALUES
   ('Janis', 'Joplin'),
   ('Jim', 'Morrison'),
   ('Jerry', 'Garcia'),
   ('Jimi', 'Hendrix'),
   ('Bob', 'Dylan');
  
INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Lunch', 'What is your favorite lunch meat?', 1),
  ('Movies', 'What is your favorite movie?', 2),
  ('Roads', 'How many roads must a man walk down?', 5),
  ('Stuck', 'Oh, mama, is this really the end?', 5),
  ('Stone', 'How does it feel, to be on your own?', 5);
  
INSERT INTO
  replies (body, question_id, parent_id, user_id)
VALUES
  ('More chicken than a man ever seen', 1, NULL, 2),
  ('That is not funny, Jim', 1, 1, 3),
  ('I highly doubt that', 1, 1, 1),
  ('Twelve', 5, Null, 1),
  ('Guess again', 5, 4, 5),
  ('Eight?', 5, 4, 1);
  
INSERT INTO 
  question_followers (question_id, user_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 5),
  (2, 2),
  (2, 3),
  (3, 1),
  (3, 2),
  (3, 4),
  (3, 5);
  
INSERT INTO
  question_likes(question_id, user_id)
VALUES
  (3, 1),
  (3, 2),
  (3, 3),
  (3, 4),
  (3, 5),
  (2, 1),
  (2, 3),
  (2, 4),
  (2, 5),
  (1, 1),
  (1, 3),
  (4, 1),
  (4, 3),
  (5, 2);