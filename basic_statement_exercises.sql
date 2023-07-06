USE albums_db;
SHOW tables;
DESCRIBE albums;

/* 
Q: What is the primary key for the albums table?
A: the primary key is 'id'

Q: What does the column named 'name' represent?
A: Name represents the full of the album, data type is varchar

Q: What do you think the sales column represents?
A: it represents a numerical count of every album sold
*/

SELECT * FROM albums;

SELECT name, artist, release_date
FROM albums
WHERE artist = 'Pink Floyd';

/*
Q:What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
A: 1967
*/
SELECT release_date
FROM albums
Where name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

/*
Q:What is the genre for the album Nevermind?
A: Grunge, Alternative rock

*/

SELECT genre
FROM albums
WHERE name = 'Nevermind';

SELECT name, release_date
FROM albums
WHERE release_date BETWEEN 1990 AND 1999; -- OR WHERE release_date < 2000 AND release_date > 1989;

SELECT name AS low_selling_albums
FROM albums
WHERE sales > 20;