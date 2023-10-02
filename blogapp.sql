CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	uname varchar(50) NOT NULL,
	uemail varchar(50) NOT NULL,
	upw varchar(50) NOT NULL,
	umobile varchar(20) NOT NULL
)

INSERT INTO users (uname, uemail, upw, umobile)
VALUES
	('bang', 'bang@gmail.com', 'bang', '019282121')
	
	
SELECT * FROM users WHERE uemail = 'bang@gmail.com' AND upw = 'bang'