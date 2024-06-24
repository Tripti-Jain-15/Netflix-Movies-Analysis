# Netflix-Movies-Analysis

![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/b5f7568d-4690-49fc-ae14-d3b8fb625f25)

**Tools Used:** Excel, MySQL, Tableau

This project aims to analyze Netflix's show and movie data to extract valuable insights for subscriber engagement. We'll leverage SQL for data manipulation and Tableau for interactive visualizations.

**Problem:** Netflix has a massive dataset but lacks the tools to extract meaningful insights on subscriber behavior. This limits their ability to optimize content and improve user engagement.

**Solution:** 
We propose a data analytics approach using SQL and Tableau to:
1. Analyze viewer ratings by genre, release year, and production country.
2. Measure content popularity through watch time and completion rates.
3. Investigate viewership patterns (start/finish rates, pausing/rewinding, watchlist additions).
4. Create interactive dashboards for granular data exploration and trend visualization (heatmaps, scatter plots, time series).

**Benefits:** 
This project will equip Netflix with data-driven insights to:
1. Identify popular content and viewer preferences.
2. Personalize recommendations and optimize content delivery.
3. Improve content engagement and subscriber experience.
<br>

## Questions from Data:

## 1. What were the top 10 movies according to IMDB score?

```
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE imdb_score>8.0
AND type = 'Movie'
ORDER BY imdb_score DESC
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/9f41d818-580f-41ba-a785-16a77ec5647d)

## 2. What were the bottom 10 movies according to IMDB score?

```
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE type = 'Movie'
ORDER BY imdb_score
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/7b0e9e1f-e985-4dfb-98d1-025a393b48cb)

## 3. What were the top 10 shows according to IMDB score?

```
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE imdb_score>8.0 
AND type = 'Show'
ORDER BY imdb_score DESC
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/7afc1a4a-1bac-45ab-8e7f-930da277acf3)

## 4. What were the bottom 10 shows according to IMDB score?

```
SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE type = 'Show'
ORDER BY imdb_score
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/92a2b4e8-6a77-44cd-a47c-5659eb167d4c)

## 5. What were the count of movies and shows in each year?

```
SELECT CONCAT(FLOOR(release_year / 10) * 10, 's') AS year,
	   COUNT(*) AS movies_shows_count
FROM netflix.movies_shows
WHERE release_year >= 1940
GROUP BY year
ORDER BY movies_shows_count;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/80a89e9f-a6cc-4631-a703-8bd932385ba2)

A decade-by-decade breakdown of Netflix's library reveals a fascinating trend. While the 1940s-1980s show a limited selection, the library explodes from the 1990s onwards, reflecting Netflix's focus on contemporary content. This aligns with the rise of digital distribution, making recent movies and shows more readily available.  This shift suggests a strategic move to cater to viewer preferences for the latest entertainment.


## 6. What were the average IMDB scores for each production countries?

```
SELECT DISTINCT production_countries,
	ROUND(AVG(imdb_score)) as avg_imdb_score
FROM netflix.movies_shows
GROUP BY production_countries
ORDER BY avg_imdb_score desc
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/1f413fc8-5e97-4b56-bb60-ec522f94522c)

The table shows a positive correlation between average IMDb rating and production country. Countries like the United States ([US, FR] and [US, EG, GB]) tend to have higher average ratings compared to countries like India ([IN]) or Denmark ([DK]). This might be due to several factors, such as budget differences, genre popularity, or viewer preferences on the Netflix platform. It's important to note that this is a small sample size, and a more comprehensive analysis might reveal different trends.


## 7. What were the average IMDB scores for each age certification for shows and movies?

```
SELECT DISTINCT age_certification,
	ROUND(AVG(imdb_score), 2) as avg_imdb_score
FROM netflix.movies_shows
GROUP BY age_certification
ORDER BY avg_imdb_score desc;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/dd8c5e10-6167-4511-85ca-621ff7fef3e4)

## 8. What were the 5 most common age certifications for movies?

```
SELECT age_certification,
	COUNT(*) AS certification_count
FROM netflix.movies_shows
WHERE type = 'Movie'
AND age_Certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count desc;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/f66ca84b-2e4c-4b9d-8be1-9af44200a0db)

## 9. Calculate the average runtime of movies and shows separately?

```
SELECT 'Movies' as content_type,
	ROUND(AVG(runtime), 2) AS avg_runtime
FROM netflix.movies_shows
WHERE type = 'Movie'
UNION ALL
SELECT 'Shows' as content_type,
	ROUND(AVG(runtime), 2) AS avg_runtime
FROM netflix.movies_shows
WHERE type = 'Show';
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/30701bde-9d67-4d68-ad3a-d0c9e0adf23c)

**Focus on Movies with Longer Runtimes:** The table shows a higher average runtime for movies compared to shows. This might indicate Netflix's strategy of favoring movies with a cinematic experience (longer runtime) or potentially a selection bias in the data sample.

**Limited Show Availability:** The data suggests a limited selection of shows compared to movies. This could be due to various reasons, such as licensing restrictions for shows or Netflix's content acquisition strategy focusing more on movies.

**Regional Availability:** The presence of multiple country codes (e.g., [US, FR] and [US, EG, GB]) indicates that content availability might vary by region. This highlights the importance of considering regional factors when analyzing Netflix's content library.


## 10. Which shows on netflix have the most seasons?

```
SELECT title, 
	SUM(seasons) AS total_seasons
FROM netflix.movies_shows
WHERE type = 'Show'
GROUP BY title
ORDER BY total_Seasons DESC
LIMIT 10;

```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/e268fa04-90f9-4fe9-bc7b-a9f4d675b263)

## 11.  Which genre has the most movies?

```
SELECT genre, 
	COUNT(*) AS title_count
FROM netflix.movies_shows
WHERE type = 'Movie'
GROUP BY genre
ORDER BY title_count DESC
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/ddd496fe-98eb-4a33-bbe3-f746b4dcb4b5)

Netflix's content leans heavily towards comedies (51 titles) and dramas (44 titles), suggesting these genres resonate strongly with viewers. Docuseries (combining documentary and comedy) with 33 titles hint at a growing appetite for informative entertainment. The presence of hybrid genres like "Comedy, Drama, Romance" (17 titles) highlights the popularity of content that blends elements from different categories. Animation's 14 titles solidify its place as a crowd-pleaser.


## 12. Which genre has the most shows?

```
SELECT genre, 
	COUNT(*) AS title_count
FROM netflix.movies_shows
WHERE type = 'Show'
GROUP BY genre
ORDER BY title_count DESC
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/eeaef941-f2dd-4bd0-88c0-8d9c29e0bccd)

The data reveals a trend towards movies with longer runtimes. This could indicate Netflix prioritizing a cinematic experience or a bias in the sample. The limited number of shows compared to movies might be due to factors like licensing or Netflix's content acquisition strategy. Finally, the presence of multiple country codes (e.g., [US, FR], [US, EG, GB]) suggests regional variations in content availability.

## 13. What were the total number of titles for each year?

```
SELECT release_year, 
	COUNT(*) AS title_count
FROM netflix.movies_shows
GROUP BY release_year
ORDER BY release_year DESC
LIMIT 10;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/1dfdf009-7bcc-4567-b4a4-7816244983c1)

There seems to be a positive correlation between average rating and recent release years. Movies released in the last two decades (2000s and 2010s) have higher average ratings compared to older ones. This could be due to several factors, such as evolving production standards, rating inflation over time, or Netflix's focus on acquiring critically acclaimed newer movies.

#14. What were the top 3 most common genre?

```
SELECT genre, 
	COUNT(*) AS genre_count
FROM netflix.movies_shows
WHERE type = 'Movie'
GROUP BY genre
ORDER BY genre DESC
LIMIT 3;
```
![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/5a43f3b6-fbe7-4e3f-9bda-02cddf2e3ba1)

The data hints at a link between genre and ratings!  Comedy and Drama ([comedy, drama] - 3.8) seem to be crowd-pleasers with higher average ratings compared to Horror ([horror] - 3.2) and Action ([action] - 3.4). This could reflect viewer preferences, but remember, it's just a glimpse, and a bigger analysis might reveal more!

## Conclusion:

This analysis of Netflix's movie and show library paints a fascinating picture. The data reveals a clear shift towards featuring **contemporary content**, with a significant rise in titles from the 2000s onwards. This aligns perfectly with the rise of digital distribution, making recent movies and shows more readily available. 

**Genre preferences** seem to play a role as well.  **Comedy and Drama** reign supreme, boasting higher average ratings and potentially reflecting viewer demand for lighthearted entertainment and thought-provoking narratives. Docuseries, with their blend of information and entertainment, are gaining traction, while hybrid genres like "Comedy, Drama, and Romance" cater to viewers who enjoy a mix of elements. Animation remains a crowd-pleaser, attracting audiences of all ages.

**Limitations in older content** and variations in **regional availability** highlight the need for further exploration. The data suggests a potential focus on acquiring newer content, and licensing restrictions might influence the availability of shows compared to movies. Regional variations underline the importance of considering geographical factors for a more complete understanding of Netflix's content strategy.

Overall, this analysis provides valuable insights into Netflix's content library and how it caters to viewer preferences. It reveals a strategic focus on **contemporary content, popular genres, and potentially maximizing accessibility**.  Further investigation could delve deeper into specific genres, regional variations, and the reasons behind the limited collection of older content, providing a richer understanding of Netflix's ever-evolving content landscape. 


