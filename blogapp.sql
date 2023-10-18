CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	uname varchar(50) NOT NULL,
	uemail varchar(50) NOT NULL,
	upw varchar(50) NOT NULL,
	umobile varchar(20) NOT NULL
)

CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    title TEXT,
    creation_date TIMESTAMP DEFAULT NOW(),
    content TEXT
);

SELECT users.id, users.uname, 
blog_posts.id AS id_blog, blog_posts.title, blog_posts.creation_date, blog_posts.content
FROM users
INNER JOIN blog_posts
ON users.id = blog_posts.user_id
WHERE blog_posts.id = 10
GROUP BY users.id, id_blog

SELECT * FROM blog_posts
GROUP BY blog_posts.id
ORDER BY blog_posts.id DESC
