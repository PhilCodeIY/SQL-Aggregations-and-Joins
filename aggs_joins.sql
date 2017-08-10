
#SQL: Aggregations and Joins

#Aggregations

# 1. Get the average rating for a movie
SELECT 
    m.movieid,
    m.title,
    COUNT(r.rating) AS ratingsCount,
    SUM(r.rating) AS ratingsSum,
    AVG(rating) AS averageRating
FROM
    movies.movies m
        LEFT JOIN
    movies.ratings r ON m.movieid = r.movieid
WHERE
    m.movieid = 1;

#2. Get the total ratings for a movie
SELECT 
    m.movieid,
    m.title,
    COUNT(r.rating) AS ratingsCount,
    SUM(r.rating) AS ratingsSum
FROM
    movies.movies m
        LEFT JOIN
    movies.ratings r ON m.movieid = r.movieid
WHERE
    m.movieid = 1;

#3. Get the total movies for a genre

SELECT 
    mg.genre_id, COUNT(mg.genre_id) AS genreidCount
FROM
    movies.movies m
        LEFT JOIN
    movies.movie_genre mg ON m.movieid = mg.movieid
GROUP BY mg.genre_id ASC;

# 4. Get the average rating for a user
SELECT 
    r.userid,
    COUNT(r.rating) AS ratingsCount,
    SUM(r.rating) AS ratingsSum,
    AVG(rating) AS avgSum
FROM
    movies.ratings r
GROUP BY r.userid ASC;

#5. Find the user with the most ratings

SELECT 
    r.userid, COUNT(r.userid) AS totalCount
FROM
    movies.ratings r
GROUP BY r.userid
ORDER BY totalCount DESC
LIMIT 1;


#6 Find the user with the highest average rating
#AND
#7. Find the user with the highest average rating with more than 50 reviews

SELECT 
    r.userid,
    COUNT(r.rating) AS ratingsCount,
    SUM(r.rating) AS ratingsSum,
    AVG(rating) AS avgSum
FROM
    movies.ratings r
GROUP BY r.userid 
order by avgSum desc
LIMIT 1;

#8, Find the movies with an average rating over 4

SELECT 
    movies.title, ratings.rating, 
    AVG(ratings.rating) AS avgSum
FROM
    movies.movies
        LEFT JOIN
    movies.ratings ON movies.movieid = ratings.movieid
WHERE
    ratings.rating > 4
GROUP BY movies.movieid
ORDER BY ratings.rating DESC;

#9. For each genre find the total number of reviews as well as the average review sort by highest average review.

?


# Joins

#1. Find all comedies
SELECT m.title, m.genres
FROM movies.movies m
WHERE m.genres  LIKE 'com%';

#2. Find all comedies in the year 2000
SELECT 
    m.title
FROM
    movies.movies m
WHERE
    m.genres LIKE 'com%'
    and
	m.title LIKE '%(2000)%';

#3. Find any movies that are about death and are a comedy

SELECT 
    m.title
FROM
    movies.movies m
WHERE
    m.genres LIKE 'com%'
    and
	m.title LIKE '%death%';


#4. Find any movies from either 2001 or 2002 with a title containing super

SELECT 
    m.title
FROM
    movies.movies m
WHERE
    m.title LIKE 'super%'
        AND m.title LIKE '%(2001%'
        OR m.title LIKE 'super%'
        AND m.title LIKE '%(2002%';



