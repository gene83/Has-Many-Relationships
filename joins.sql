SELECT * 
FROM users;

SELECT *
FROM posts
WHERE user_id = 100;

SELECT posts.id, posts.title, posts.url, posts.content, posts.created_at, posts.updated_at, users.first_name, users.last_name
FROM posts 
INNER JOIN users ON posts.user_id = users.id
WHERE user_id = 200;

SELECT posts.id, posts.title, posts.url, posts.content, posts.created_at, posts.updated_at, users.username
FROM posts
INNER JOIN users on posts.user_id = users.id 
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT users.username
FROM users
INNER JOIN posts on posts.user_id = users.id 
where posts.created_at  > DATE '2015-01-01';

SELECT posts.title, posts.content, users.username 
FROM posts
INNER JOIN users on posts.user_id = users.id 
WHERE users.created_at > DATE '2015-01-01';

SELECT posts.title AS Post_Title, comments.id, comments.body, comments.created_at, comments.updated_at
FROM comments 
INNER JOIN posts on comments.post_id = posts.id;

SELECT posts.title AS Post_Title, posts.url AS post_url, comments.body AS comment_body
from comments 
INNER JOIN posts on comments.post_id = posts.id 
WHERE posts.created_at < DATE '2015-01-01';

SELECT posts.title AS Post_Title, posts.url AS post_url, comments.body AS comment_body
from comments 
INNER JOIN posts on comments.post_id = posts.id 
WHERE posts.created_at > DATE '2015-01-01';

SELECT posts.title AS Post_Title, posts.url AS post_url, comments.body AS comment_body
from comments 
INNER JOIN posts on comments.post_id = posts.id 
WHERE comments.body ~ 'USB';

SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM comments 
INNER JOIN posts on comments.post_id = posts.id 
INNER JOIN users on posts.user_id = users.id
WHERE  comments.body ~ 'matrix';

SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments 
INNER JOIN users on comments.user_id = users.id 
INNER JOIN posts on comments.post_id = posts.id 
WHERE comments.body ~ 'SSL' AND posts.content ~ 'dolorum';

SELECT users.first_name AS post_author_first_name , users.last_name AS post_author_last_name, posts.title AS post_title, 
(SELECT users.username  from users WHERE users.id = comments.user_id) AS comment_author_username
FROM comments
INNER JOIN posts on comments.post_id = posts.id
INNER JOIN users on posts.user_id = users.id 
WHERE posts.content ~ 'nemo' AND (comments.body ~ 'SSL' OR comments.body ~ 'firewall');

SELECT COUNT(*) 
FROM comments 
INNER JOIN posts on comments.post_id = posts.id 
WHERE posts.created_at > DATE '2015-07-14';

SELECT users.username 
FROM comments 
INNER JOIN users on comments.user_id = users.id 
where comments.body ~ 'programming'