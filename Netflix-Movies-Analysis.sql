-- What were the top 10 movies according to IMDB score?
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE imdb_score>8.0
AND type = 'Movie'
ORDER BY imdb_score DESC
LIMIT 10;

-- What were the bottom 10 movies according to IMDB score?
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE type = 'Movie'
ORDER BY imdb_score
LIMIT 10;

-- What were the top 10 shows according to IMDB score?
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE imdb_score>8.0 
AND type = 'Show'
ORDER BY imdb_score DESC
LIMIT 10;

-- What were the bottom 10 shows according to IMDB score?
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE type = 'Show'
ORDER BY imdb_score
LIMIT 10;

-- What were the count of movies and shows in each year?
SELECT CONCAT(FLOOR(release_year / 10) * 10, 's') AS year,
	   COUNT(*) AS movies_shows_count
FROM netflix.movies_shows
WHERE release_year >= 1940
GROUP BY year
ORDER BY movies_shows_count;

-- What were the average IMDB scores for each production countries?
SELECT DISTINCT production_countries,
	ROUND(AVG(imdb_score)) as avg_imdb_score
FROM netflix.movies_shows
GROUP BY production_countries
ORDER BY avg_imdb_score desc;

-- What were the average IMDB scores for each age certification for shows and movies?
SELECT DISTINCT age_certification,
	ROUND(AVG(imdb_score), 2) as avg_imdb_score
FROM netflix.movies_shows
GROUP BY age_certification
ORDER BY avg_imdb_score desc;

-- What were the 5 most common age certifications for movies?
SELECT age_certification,
	COUNT(*) AS certification_count
FROM netflix.movies_shows
WHERE type = 'Movie'
AND age_Certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count desc;

-- Calculate the average runtime of movies and shows separately? 
SELECT 'Movies' as content_type,
	ROUND(AVG(runtime), 2) AS avg_runtime
FROM netflix.movies_shows
WHERE type = 'Movie'
UNION ALL
SELECT 'Shows' as content_type,
	ROUND(AVG(runtime), 2) AS avg_runtime
FROM netflix.movies_shows
WHERE type = 'Show';

-- Which shows on netflix have the most seasons?
SELECT title, 
	SUM(seasons) AS total_seasons
FROM netflix.movies_shows
WHERE type = 'Show'
GROUP BY title
ORDER BY total_Seasons DESC
LIMIT 10;

-- Which genre has the most movies?
SELECT genre, 
	COUNT(*) AS title_count
FROM netflix.movies_shows
WHERE type = 'Movie'
GROUP BY genre
ORDER BY title_count DESC
LIMIT 10;

-- Which genre has the most shows?
SELECT genre, 
	COUNT(*) AS title_count
FROM netflix.movies_shows
WHERE type = 'Show'
GROUP BY genre
ORDER BY title_count DESC
LIMIT 10;

-- What were the total number of titles for each year?
SELECT release_year, 
	COUNT(*) AS title_count
FROM netflix.movies_shows
GROUP BY release_year
ORDER BY release_year DESC
LIMIT 10;

-- What were the top 3 most common genre?
SELECT genre, 
	COUNT(*) AS genre_count
FROM netflix.movies_shows
WHERE type = 'Movie'
GROUP BY genre
ORDER BY genre DESC
LIMIT 3;
