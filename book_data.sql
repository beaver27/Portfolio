CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
SELECT 
    *
FROM
    books;
DESC books;
-- to concate the string elements [to merge columns/data to build some meaningful outcome] with applying aliase to make it sound meaningful
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author_name
FROM
    books;
-- another way to concate but here it is with separator
SELECT 
    CONCAT_WS('-', title, author_fname, author_lname)
FROM
    books;
-- Using 'Substring()/SUBSTR() function to fetch part of the string to work with
SELECT 
    SUBSTRING(author_lname, 1, 1) AS initial, author_lname
FROM
    books;
-- Combine two operations [to know how]
SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title'
FROM
    books;
-- use REPLACE to replace the string with another
SELECT 
    REPLACE(title, ' ', '-')
FROM
    books;
-- to reverse the string using REVERSE function
SELECT 
    REVERSE(author_fname)
FROM
    books;
-- using CHAR_LENGTH to find character length [storage length in bytes can be found using LENGTH function]
SELECT 
	CHAR_LENGTH(title), title 
FROM 
	books;
-- using UPPER()/UCASE() and LOWER()/LCASE() to change string's case
SELECT
	upper(title)
FROM
	books;
SELECT
	concat('I LOVE ', Ucase(title), ' !!!')
FROM
	books;
-- INSERT function to add string to another string [change string in the middle, front, back]
SELECT 
	INSERT(title, 6, 6, ' Silly')
FROM 
	books;
-- To bring left most or right most characters using LEFT() and RIGHT()
SELECT 
	LEFT(author_lname, 1),
    RIGHT(author_fname, 6)
FROM books;
-- To repeat the characters in a string
SELECT 
	REPEAT(title, 2)
FROM books;
SELECT 
	reverse(upper('Why does my cat look at me with such hatred?'));
SELECT 
	REPLACE(title, ' ', '->') AS title
FROM books;
SELECT 
	author_lname AS forwards, reverse(author_lname) AS backwards
FROM 
	books;
SELECT 
	UPPER(concat(author_fname, ' ', author_lname)) AS 'full name in caps'
FROM books;
SELECT
	concat(title, ' was released in ', released_year) AS blurb
FROM books;
SELECT
	title, char_length(title) AS title
FROM books;
SELECT
	CONCAT(LEFT(title, 10), '...') AS 'short title',
    concat(author_lname, ',', author_fname) AS author,
    concat(stock_quantity, ' in stock') AS quantity
FROM books;
INSERT INTO books
	(title, author_fname, author_lname, released_year, stock_quantity, pages)
values ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
	   ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- using DISTINCT clause to get unique values
SELECT distinct author_lname 
FROM books;
SELECT distinct released_year
FROM books;
SELECT distinct 
	concat(author_fname, ' ', author_lname)
FROM books;
-- to select uniqe combinations using DISTINCT
SELECT distinct author_fname, author_lname
FROM books;
SELECT distinct author_fname, author_lname, released_year
FROM books;
-- to order the column in ascending or descending order use ORDER BY [comes last in the syntax]
SELECT book_id, author_fname, author_lname
FROM books
ORDER BY author_fname DESC;
SELECT book_id, author_fname, author_lname
FROM books
ORDER BY author_lname;
-- for numerical order
SELECT title, pages
FROM books
ORDER BY pages asc;
SELECT title, pages
FROM books
ORDER BY released_year asc;
-- to select an ORDER BY column in an easier way
SELECT book_id, author_fname, author_lname, pages
FROM books
ORDER BY 4; -- 4 means column 4 in SELECT command which is pages in this case.
SELECT author_lname, released_year, title 
FROM books
ORDER BY author_lname, released_year DESC; -- firstly orders by author's last name and then the release year of the books.
-- using alias to set order of the data [in ascending manner bcz if nothing is mentioned then ASC is done by default]
SELECT concat(author_fname, ' ', author_lname) AS author 
FROM books
ORDER BY author;
-- to manage/limit the no. of results we get to see
SELECT book_id, released_year, title
FROM books
ORDER BY released_year
LIMIT 5;
SELECT book_id, released_year, title
FROM books
ORDER BY released_year DESC
LIMIT 1,5; -- starts from 2nd row and total 5 entries [0-indexing]
-- using LIKE operator to find right data fields
SELECT title, author_fname, author_lname
FROM books 
WHERE author_fname LIKE '%da%'; -- '%' wildcard finds unlimited characters or no. instead of the sign 
SELECT * FROM books
WHERE author_fname LIKE '____'; -- 4 underscores to seek exact 4 no. of characters from author_fname
-- Exercise
SELECT title
FROM books
WHERE title LIKE '%stories%';
SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;
SELECT 
	CONCAT(title, ' - ', released_year) AS summary
FROM books
ORDER BY released_year DESC
LIMIT 1,3;
SELECT DISTINCT title, author_lname
FROM books
WHERE author_lname LIKE('% %');
SELECT DISTINCT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity 
LIMIT 3;
SELECT title, author_lname
FROM books
ORDER BY author_lname, title;
SELECT 
		Upper(CONCAT ('MY FAVOURITE AUTHOR IS ', author_fname, ' ', author_lname, ' !')) AS yell
FROM books
ORDER BY author_lname;
-- to count how many rows are there in the table using COUNT function
SELECT COUNT(*) FROM books;
SELECT * FROM books;
DELETE 
FROM books;
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343),
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- to count distinct entries of the table
SELECT COUNT(DISTINCT author_fname) FROM books;
-- counting specific type of case entries in the table
SELECT COUNT(*) FROM books
WHERE title LIKE '%the%';
-- Grouping by, counting the rows, Ordering by the aliase created
SELECT author_lname, COUNT(*) AS books_written
FROM books
GROUP BY author_lname
ORDER BY books_written DESC;
-- finding MIN/MAX of the feature values
SELECT MAX(pages) FROM books;
-- writting subqueries
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
-- multiple grouping
SELECT author_fname, author_lname, COUNT(*)
FROM books
GROUP BY author_lname, author_fname;
-- MIN/MAX with GROUP BY function
SELECT 
	author_lname,
    COUNT(*) as books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release
FROM books GROUP BY author_lname;
-- to find Average number using AVG aggregate function
SELECT AVG(released_year)
FROM books;
SELECT released_year, 
	AVG(stock_quantity),
    COUNT(*)
FROM books
GROUP BY released_year;
-- Exercise
SELECT COUNT(*)
FROM books;
SELECT released_year,
	COUNT(*)
FROM books
GROUP BY released_year;
SELECT SUM(stock_quantity)
FROM books
GROUP BY stock_quantity;
SELECT
	CONCAT(author_fname, '', author_lname) AS author,
    AVG(released_year)
FROM books
GROUP BY author;
SELECT MAX(pages),
	CONCAT(author_fname, ' ', author_lname) AS fullname
FROM books
GROUP BY fullname
ORDER BY MAX(pages) DESC
LIMIT 1;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT released_year AS year,
	COUNT(*) AS '#books',
    AVG(pages) as 'avg pages' 
FROM books
GROUP BY released_year
ORDER BY released_year ASC;
CREATE TABLE people(
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME);
    DESC people;
    INSERT INTO people(name, birthdate, birthtime, birthdt)
		Values('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00'),
        ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10'),
        ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
        SELECT * FROM people;
	DELETE FROM people
    WHERE name='Elton';
     INSERT INTO people(name, birthdate, birthtime, birthdt)
		Values('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
	-- to fetch current time using CURTIME()/CURRENTTIME()
    SELECT CURTIME();
    -- to fetch current date using CURDATE/CURRENTDATE()
    SELECT curdate();
    -- to fetch current date-time  using NOW()/CURRENT_TIMESTAMP
    SELECT now();
    SELECT current_timestamp();
    -- to parse day from the birthdate
    SELECT birthdate, day(birthdate), dayofweek(birthdate), dayofyear(birthdate) FROM people;
    -- to parse name of the month
    SELECT birthdate, monthname(birthdate) FROM people;
    -- parse function for time
    SELECT name, birthtime, HOUR(birthtime), minute(birthtime), minute(birthdt), second(birthtime) FROM people;
    -- using DATEFORMAT() to format the date
    SELECT birthdate, date_format(birthdate, '%W, %b, %D') FROM people;
    -- using DATEFORMAT() to format the time element
    SELECT birthdt, DATE_FORMAT(birthdt, '%r') FROM people;
    -- using DATEDIFF function to find out the number of days difference
    SELECT birthdate, datediff(CURDATE(), birthdate) FROM people;
    SELECT date_add(CURDATE(), INTERVAL 1 YEAR);
    SELECT date_sub(CURDATE(), INTERVAL 1 MONTH);
    SELECT CURTIME();
    SELECT TIMEDIFF(CURTIME(), '07:00:00');
    SELECT name, birthdate, birthdate + INTERVAL 21 YEAR FROM people;
    CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 -- crating TIMESTAMP and turning UPDATE ON constraint 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- using logical operator NOT Equal != to exclude selecgted results
SELECT title, author_lname 
FROM books
WHERE author_lname != 'Gaiman';
-- using logical operator NOT LIKE to exclude certain pattern
SELECT title 
FROM books 
WHERE title NOT LIKE '% %';
-- > (greater than) sign as logical operator
SELECT * FROM books
WHERE released_year > 2005;
SELECT * FROM books
WHERE released_year <= 1985;
-- Logical AND operator
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';
-- LOgical OR operator
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';
-- BETWEEN operator and NOT BETWEEN operator
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;
 
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;
-- using CAST function to change the datatype to make relevent for the comparison inthe syntax
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('9:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);

SELECT * FROM people WHERE HOUR(birthtime) -- extracting hour only to make the comparison simpler
BETWEEN 12 AND 16;
-- IN operator (to make the syntax short crisp and cleaner)
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- using modulo operator(%) to use mathematical remainder operation into SQL query practice 
SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;
-- Using CASE statement to introduce condition in the syntax
SELECT 
    title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'modern lit'
        ELSE '20th century lit'
    END AS genre
FROM
    books;
    
SELECT 
    title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
-- using IS NULL operator to find empty rows
SELECT * FROM books 
WHERE author_lname IS NULL;
-- Exercises
SELECT * FROM books
WHERE released_year < 1980;
SELECT * FROM books
WHERE author_lname = 'Eggers' or
author_lname = 'Chabon';
SELECT * FROM books 
WHERE author_lname='Lahiri' AND
released_year > 2000;
SELECT * FROM books
WHERE pages between 100 AND 200;
SELECT * FROM books
WHERE author_lname LIKE('C%') or
author_lname LIKE('S%');
SELECT title, author_lname,
CASE
WHEN title LIKE ('%Stories%') THEN 'Short Stories'
WHEN title='Just Kids' OR title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel'
END AS 'Type'
FROM books;
SELECT author_fname, author_lname,
CASE
	WHEN COUNT(*) = 1 THEN '1 book'
	ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books
GROUP BY author_fname, author_lname;
-- using UNIQUE constraint to keep records unique
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
SELECT * FROM contacts;
-- to check constraints use CHECK keyword and set a boolean condition for feature value [also to name constraint CONSTRAINT keyword can be used]
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT 
   CONSTRAINT age_over_18 CHECK (age > 18)
);
INSERT INTO users (username, age)
Values ('chickenlady', -9);
-- setting up constraint with UNIQUE keyword
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
-- Constraint using CHECK operator with string comparison
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);
-- ALTER TABLE to alter the table content
ALTER TABLE companies
ADD COLUMN phone VARCHAR(15);
SELECT * FROM companies;
DESC companies;
ALTER TABLE companies
DROP COLUMN phone;
-- Renaming tables
RENAME TABLE companies TO suppliers;
SELECT * FROM suppliers;
ALTER TABLE suppliers rename TO companies;
-- Renaming column name
ALTER TABLE companies
RENAME COLUMN name TO company_name;
-- modifying the data type & constraint
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';
-- to change column name & type at once
ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);
-- adding and dropping constraints by altering the table
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
