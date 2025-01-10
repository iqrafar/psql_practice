DROP DATABASE IF EXISTS my_bookshops;
CREATE DATABASE my_bookshops;
\c my_bookshops;
CREATE TABLE books_table (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL, 
    price_in_pence INT,
    quantity_in_stock INT,
    release_date DATE,
    is_fiction BOOL NOT NULL
);
INSERT INTO books_table 
    (book_id, title, price_in_pence, quantity_in_stock, release_date, is_fiction)
VALUES
    (1, 'The Hitchhiker''s Guide to the Galaxy', 899, 560, '1997-10-12', TRUE),
    (2, 'The Little Prince', 699, 1020, '1943-04-06', TRUE),
    (3, 'The Tale of Peter Rabbit', 599, 1000, '1902-10-01', TRUE),
    (4, 'Emma', 522, 390, '1815-12-23', TRUE),
    (5, 'Nineteen Eighty-Four', 799, 420, '1949-06-08', TRUE),
    (6, 'The Handmaid''s Tale', 899, 10, '1985-08-01', TRUE),
    (7, 'The War of The Worlds', 250, 17, '1897-04-01', TRUE),
    (8, 'Captain Corelli''s Mandolin', 999, 0, '1995-08-29', TRUE),
    (9, 'A Brief History of Time', 825, 0, '1988-04-01', FALSE),
    (10, 'Pride and Prejudice', 699, 4, '1813-01-28', True);

-- QUERIES
-- SELECT * FROM books_table;
-- SELECT * FROM books_table WHERE quantity_in_stock > 0;
-- SELECT * FROM books_table WHERE is_fiction = FALSE;
-- SELECT * 
-- FROM books_table 
-- WHERE DATE(release_date) BETWEEN '1900-01-01' AND '1999-12-31';
-- SELECT 
--     *
-- FROM
--     books_table
-- WHERE title LIKE 'The%';
-- SELECT
--     *
-- FROM 
--     books_table
-- ORDER BY
--     title ;
-- SELECT
--     *
-- FROM
--     books_table
-- ORDER BY
--     price_in_pence DESC
-- LIMIT
--     1 ;
-- DELETE FROM
--     books_table
-- WHERE 
--     quantity_in_stock = 0
-- RETURNING *;
-- UPDATE
--     books_table
-- SET
--     price_in_pence = price_in_pence * 0.9
-- WHERE 
--     quantity_in_stock > 10
-- RETURNING *;

CREATE TABLE author_table (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(200) NOT NULL,
    fun_fact VARCHAR(500)
    );
INSERT INTO author_table
(author_name, fun_fact)
VALUES
    ('Dan Brown', 'Favourite colour is not brown.'),
    ('Antoine de Saint-Exupéry', 'He was a successful commercial pilot before World War II, working airmail routes in Europe, Africa, and South America.'),
    ('Douglas Adams', 'He made two appearances in Monty Python''s Flying Circus.'),
    ('Stephen Hawking', 'Doctors told him he wouldn''t live past his early 20s.'),
    ('Eric Carle', 'When he was a young boy, Carle had a dream that he would build a bridge from Germany to America.'),
    ('J. D. Salinger', 'The Catcher in the Rye was the only novel that J.D. Salinger published during his lifetime. Not bad for a first try!'),
    ('Beatrix Potter', 'Between 1881 and 1897, Potter kept a journal in which she jotted down her private thoughts in a secret code. This code was so fiendishly difficult, it was not cracked and translated until 1958.'),
    ('C. S. Lewis', 'Lewis set up a charitable trust to give away whatever money he received from his books.'),
    ('Roald Dahl', 'During World War II, he passed intelligence to MI6 from Washington.'),
    ('Frank Herbert', 'While conversing with fungi expert Paul Stamets, Herbert revealed that the world of Dune was influenced by the lifecycle of mushrooms, with his imagination being helped along by a more "magic" variety.'),
    ('Louis de Bernières', 'De Bernières is an avid musician who plays flute, mandolin, clarinet and guitar.'),
    ('H. G. Wells', 'In 1914, H.G. Wells published a novel titled The World Set Free. In this book, he described a weapon that was eerily similar to the first atomic bomb unleashed on the Japanese cities of Hiroshima and Nagasaki in 1945.'),
    ('George Orwell', 'Orwell intentionally got himself arrested for being "drunk and incapable".'),
    ('Jane Austen', 'The author of her first novel, Sense and Sensibility, was simply "A Lady", and her later works like Pride and Prejudice were credited to "the Author of Sense and Sensibility". She wasn''t named as the author of her novels until after her death!'),
    ('Margaret Atwood', 'Atwood was the first author to contribute to The Future Library Project, which will take one writer''s contribution each year for one hundred years to be printed in the year 2114.');

-- SELECT * FROM author_table;
ALTER TABLE books_table
ADD COLUMN author_id INT,
ADD CONSTRAINT fk_author_id
FOREIGN KEY (author_id) REFERENCES author_table(author_id)
ON DELETE CASCADE;
SELECT * FROM books_table;
UPDATE
    books_table
SET
    author_id = 3
WHERE 
    title = 'The Hitchhiker''s Guide to the Galaxy';

UPDATE
    books_table
SET
    author_id = 2
WHERE 
    title = 'The Little Prince';

UPDATE
    books_table
SET
    author_id = 7
WHERE 
    title = 'The Tale of Peter Rabbit';

UPDATE
    books_table
SET
    author_id = 14
WHERE 
    title = 'Emma';

UPDATE
    books_table
SET
    author_id = 13
WHERE 
    title = 'Nineteen Eighty-Four: A Novel';

UPDATE
    books_table
SET
    author_id = 13
WHERE 
    title = 'Nineteen Eighty-Four'; 

UPDATE
    books_table
SET
    author_id = 15
WHERE 
    title = 'The Handmaid''s Tale'; 

UPDATE
    books_table
SET
    author_id = 12
WHERE 
    title = 'The War of The Worlds'; 

UPDATE
    books_table
SET
    author_id = 14
WHERE 
    title = 'Pride and Prejudice'; 
-- QUERIES
-- SELECT * FROM books_table;
-- SELECT
--     title, author_table.author_name
-- FROM 
--     books_table
-- JOIN
--     author_table ON books_table.author_id = author_table.author_id;
-- SELECT
--     author_name
-- FROM 
--     author_table
-- LEFT JOIN
-- books_table ON author_table.author_id = books_table.author_id
-- WHERE book_id IS NULL;
CREATE TABLE genres_table(
    genre_id SERIAL PRIMARY KEY,
    genre VARCHAR(500) NOT NULL
);
INSERT INTO genres_table
    (genre)
VALUES
    ('science fiction'),
    ('children''s'),
    ('romance'),
    ('fantasy'),
    ('dystopian'),
    ('science'),
    ('adventure'),
    ('classics');

SELECT * FROM genres_table;

CREATE TABLE books_genre (
    book_genre_id SERIAL PRIMARY KEY,    
    book_id INT REFERENCES books_table(book_id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres_table(genre_id)

);
INSERT INTO books_genre
    (book_id, genre_id)
VALUES
    (1, 1),
    (1, 6),
    (2, 2),
    (3, 2),
    (4, 3),
    (4, 8),
    (5, 5),
    (6, 5),
    (7, 1),
    (10, 8)
;
SELECT * FROM books_genre;
-- CREATES A JUNCTION TABLE 
SELECT * FROM books_genre
JOIN books_table 
ON books_genre.book_id = books_table.book_id
JOIN genres_table
ON books_genre.genre_id = genres_table.genre_id;
\echo '\n Here are the genres for Emma:\n'
SELECT books_table.title, genres_table.genre
FROM books_genre
JOIN books_table 
ON books_genre.book_id = books_table.book_id
JOIN genres_table
ON books_genre.genre_id = genres_table.genre_id
WHERE title = 'Emma';
\echo '\n Here are all the dystopian books:\n'
SELECT books_table.title, genres_table.genre
FROM books_genre
JOIN books_table 
ON books_genre.book_id = books_table.book_id
JOIN genres_table
ON books_genre.genre_id = genres_table.genre_id
WHERE genre = 'dystopian';
-- AGGREGATE QUERIES 
\echo '\n Here is the total number of books we have by each author:\n'
SELECT author_table.author_name, SUM(quantity_in_stock) AS total_stock
FROM books_table
JOIN author_table ON books_table.author_id = author_table.author_id
GROUP BY books_table.author_id, author_table.author_name;
\echo '\n Here is the average price for dystopian books:\n'
SELECT genres_table.genre, AVG(price_in_pence) AS average_price
FROM books_genre
JOIN books_table 
ON books_genre.book_id = books_table.book_id
JOIN genres_table
ON books_genre.genre_id = genres_table.genre_id
WHERE genre = 'dystopian'
GROUP BY genres_table.genre;
-- TEST ON DELETE CASCADE 
-- delete book from books table > impact on books_genre 
DELETE FROM books_table
WHERE title = 'The Hitchhiker''s Guide to the Galaxy';
SELECT title
FROM books_genre
JOIN books_table ON books_genre.book_id = books_table.book_id;
-- delete an author in author table > impact on books and books_genre 
SELECT author_id
FROM author_table
WHERE author_name = 'Margaret Atwood'; 
-- author id is 15

DELETE FROM author_table
WHERE author_name = 'Margaret Atwood';

SELECT author_table.author_name
FROM books_genre
JOIN books_table 
ON books_genre.book_id = books_table.book_id
JOIN genres_table
ON books_genre.genre_id = genres_table.genre_id
JOIN author_table
ON books_table.author_id = author_table.author_id;
-- get a list of each book in a single row, with all genres that the book belongs to.

SELECT books_table.title, ARRAY_AGG(genres_table.genre) AS genre 
FROM books_genre 
JOIN books_table 
ON books_genre.book_id = books_table.book_id
JOIN genres_table
ON books_genre.genre_id = genres_table.genre_id
GROUP BY books_table.title, books_table.book_id;








