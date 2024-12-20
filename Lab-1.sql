create database CSE_4A_132;
--Part – A
--1. Retrieve a unique genre of songs.
SELECT DISTINCT Genre FROM	Songs;

--2. Find top 2 albums released before 2010.
select top 2 Album_name FROM Albums
WHERE Release_year < 2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO Songs VALUES (1245, 'Zaroor', 2.55, 'Feel good', 1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE Songs
SET Genre = 'Happy'
WHERE Song_title = 'Zaroor'

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM Artists
WHERE Artist_name = 'Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE Songs
ADD Ratings decimal(3,2);

--7. Retrieve songs whose title starts with 'S'.
SELECT Song_title FROM Songs WHERE Song_title LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT Song_title FROM Songs WHERE Song_title LIKE '%Everybody%'

--9. Display Artist Name in Uppercase.
SELECT UPPER(Artist_name) FROM Artists;

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
SELECT SQRT(Duration) FROM Songs
WHERE Song_title = 'Good Luck'

--11. Find Current Date.
SELECT GETDATE()

--12. Find the number of albums for each artist.
SELECT COUNT(AL.Album_name), A.Artist_name
FROM Artists A JOIN Albums AL
ON A.Artists_id = AL.Artist_id
GROUP BY A.Artist_name

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT A.Alubm_id , COUNT(A.Alubm_id)
FROM Albums A JOIN Songs S
ON A.Alubm_id = S.Album_id
GROUP BY A.Alubm_id
HAVING COUNT(A.Alubm_id) >5

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT S.Song_title 
FROM Songs S JOIN Albums A
ON S.Album_id = A.Alubm_id
WHERE A.Album_name = 'Album1'


--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
SELECT AL.Album_name
FROM Artists A JOIN Albums AL
ON A.Artists_id = AL.Artist_id
WHERE A.Artist_name = 'Aparshakti Khurana'

--16. Retrieve all the song titles with its album title.
SELECT S.Song_title , A.Album_name
FROM Songs S JOIN Albums A
ON S.Album_id = A.Alubm_id

--17. Find all the songs which are released in 2020.
SELECT S.Song_title
FROM Songs S JOIN Albums A
ON S.Album_id = A.Alubm_id
WHERE A.Release_year = 2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW Fav_Songs AS 
SELECT * FROM Songs
WHERE Song_id BETWEEN 101 AND 105

SELECT * FROM Fav_Songs
--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE Fav_Songs
SET Song_title = 'Jannat'
WHERE Song_id = 101

--20. Find all artists who have released an album in 2020.
SELECT A.Artist_name
FROM Artists A JOIN Albums AL
ON A.Artists_id = AL.Artist_id
WHERE AL.Release_year = 2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
SELECT S.* 
FROM Songs S JOIN Albums A
ON S.Album_id = A.Alubm_id
JOIN Artists A2
ON A.Artist_id = A2.Artists_id
WHERE A2.Artist_name = 'Shreya Ghoshal'
ORDER BY Duration

--Part – B
--22. Retrieve all song titles by artists who have more than one album.
SELECT S.* 
FROM Songs S JOIN Albums A
ON S.Album_id = A.Alubm_id
JOIN Artists A2
ON A.Artist_id = A2.Artists_id
GROUP BY A2.Artist_name
HAVING COUNT(A.Album


--23. Retrieve all albums along with the total number of songs.


--24. Retrieve all songs and release year and sort them by release year.
--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
--26. List all artists who have albums that contain more than 3 songs.