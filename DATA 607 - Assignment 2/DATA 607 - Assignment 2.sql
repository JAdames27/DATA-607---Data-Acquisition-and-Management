#create a new empty table with the movie titles as columns
CREATE TABLE movie_ratings_3(
	rater_id VARCHAR(3),
    Oppenheimer INT,
    Aquaman_2 INT,
    Minions INT,
    Twisters INT,
    Deadpool_3 INT,
    Abigail INT
);

#load observations (rows) into the data frame
INSERT INTO movie_ratings_3
VALUES ("A", 5, 2, 4, 5, 5, 1),
	   ("B", NULL, 3, 2, 1, 1, 2),
	   ("C", 4, 3, NULL, 3, 2, 2),
	   ("D", 4, 1, 4, 2, 1, 3),
	   ("E", 3, NULL, 1, 5, 2, NULL);
		
#view updated data frame
SELECT * FROM movie_ratings_3;

#we have missing values for some entries
#we can use the mean of the available values incomplete columns to fill in missing values
#column 1
SET @nRating1 = (SELECT AVG(Oppenheimer) FROM movie_ratings_3);


#this line disables safe mode so we can run the rest of the code
SET SQL_SAFE_UPDATES = 0;

#update the NULL values with estimated values coming from the mean
UPDATE movie_ratings_3
SET Oppenheimer = @nRating1
WHERE Oppenheimer IS NULL;

SELECT * FROM movie_ratings_3;




#same for column 2
SET @nRating2 = (SELECT AVG(Aquaman_2) FROM movie_ratings_3);


UPDATE movie_ratings_3
SET Aquaman_2 = @nRating2
WHERE Aquaman_2 IS NULL;

SELECT * FROM movie_ratings_3;


#same for column 3
SET @nRating3 = (SELECT AVG(Minions) FROM movie_ratings_3);


UPDATE movie_ratings_3
SET Minions = @nRating3
WHERE Minions IS NULL;

SELECT * FROM movie_ratings_3;


#same for column 5
SET @nRating5 = (SELECT AVG(Abigail) FROM movie_ratings_3);


UPDATE movie_ratings_3
SET Abigail = @nRating5
WHERE Abigail IS NULL;

SELECT * FROM movie_ratings_3;



#however, since we specified the data types for the ratings as INT values, the averages are not exact..

#create a new empty table with the movie titles as columns, this time called movie_ratings_4
CREATE TABLE movie_ratings_4(
	rater_id VARCHAR(3),
    Oppenheimer INT,
    Aquaman_2 INT,
    Minions INT,
    Twisters INT,
    Deadpool_3 INT,
    Abigail INT
);

#we can ALTER the data frame INT entries to be read as DECIMAL values
ALTER TABLE movie_ratings_4 
MODIFY Oppenheimer DECIMAL(3,2),
MODIFY Aquaman_2 DECIMAL(3,2),
MODIFY Minions DECIMAL(3,2),
MODIFY Twisters DECIMAL(3,2),
MODIFY Deadpool_3 DECIMAL(3,2),
MODIFY Abigail DECIMAL(3,2)
;


#load observations (rows) into the data frame
INSERT INTO movie_ratings_4
VALUES ("A", 5, 2, 4, 5, 5, 1),
	   ("B", NULL, 3, 2, 1, 1, 2),
	   ("C", 4, 3, NULL, 3, 2, 2),
	   ("D", 4, 1, 4, 2, 1, 3),
	   ("E", 3, NULL, 1, 5, 2, NULL);
		
#view updated data frame
SELECT * FROM movie_ratings_4;

#we have missing values for some entries
#we can use the mean of the available values incomplete columns to fill in missing values
#column 1
SET @nRating1 = (SELECT AVG(Oppenheimer) FROM movie_ratings_4);


#this line disables safe mode so we can run the rest of the code
SET SQL_SAFE_UPDATES = 0;

#update the NULL values with estimated values coming from the mean
UPDATE movie_ratings_4
SET Oppenheimer = @nRating1
WHERE Oppenheimer IS NULL;

SELECT * FROM movie_ratings_4;




#same for column 2
SET @nRating2 = (SELECT AVG(Aquaman_2) FROM movie_ratings_4);


UPDATE movie_ratings_4
SET Aquaman_2 = @nRating2
WHERE Aquaman_2 IS NULL;

SELECT * FROM movie_ratings_4;


#same for column 3
SET @nRating3 = (SELECT AVG(Minions) FROM movie_ratings_4);


UPDATE movie_ratings_4
SET Minions = @nRating3
WHERE Minions IS NULL;

SELECT * FROM movie_ratings_4;


#same for column 5
SET @nRating5 = (SELECT AVG(Abigail) FROM movie_ratings_4);


UPDATE movie_ratings_4
SET Abigail = @nRating5
WHERE Abigail IS NULL;

SELECT * FROM movie_ratings_4;







