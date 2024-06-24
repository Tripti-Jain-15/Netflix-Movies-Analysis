# Netflix-Movies-Analysis

**Tools Used:** Excel, MySQL, Tableau

This project aims to analyze Netflix's show and movie data to extract valuable insights for subscriber engagement. We'll leverage SQL for data manipulation and Tableau for interactive visualizations.

**Problem:** Netflix has a massive dataset (82k rows) but lacks the tools to extract meaningful insights on subscriber behavior. This limits their ability to optimize content and improve user engagement.

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


**Questions from Data:**
<p>1. What were the top 10 movies according to IMDB score?

SELECT title, type, imdb_score 
FROM netflix.movies_shows
WHERE imdb_score>8.0
AND type = 'Movie'
ORDER BY imdb_score DESC
LIMIT 10;
</p>

![image](https://github.com/Tripti-Jain-15/Netflix-Movies-Analysis/assets/129984766/7c4a6ce0-a096-46f1-8023-552cb079cf24)

