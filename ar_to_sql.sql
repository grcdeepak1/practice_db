-- Post.all
SELECT posts.*
FROM posts
;
-- Post.first
SELECT posts.*
FROM posts
LIMIT 1
;
-- Post.last
SELECT posts.*
FROM posts
ORDER_BY DESC
LIMIT 1
;
-- Post.where(:id => 4)
SELECT posts.*
FROM posts
WHERE posts.id = 4
LIMIT 1
;
-- Post.find(4)
SELECT posts.*
FROM posts
WHERE posts.id = 4
;
-- User.count
SELECT COUNT(*)
FROM users
GROUP BY users.id
;
-- Post.select(:name).where(:created_at > 3.days.ago).order(:created_at)
SELECT posts.name
FROM posts
WHERE posts.created_at > CURRENT_DATE - 3
ORDER BY posts.created_at

-- Post.select("COUNT(*)").group(:category_id)
SELECT COUNT(*)
FROM posts
GROUP BY posts.category_id
;

-- All posts created before 2014
SELECT *
FROM posts
WHERE posts.created_at < '2014-1-1'
;

-- A list of all (unique) first names for authors who have written at least 3 posts
SELECT DISTINCT authors.first_name, COUNT(posts.author_id) AS num_posts
FROM posts JOIN authors ON authors.id = posts.author_id
HAVING num_posts >= 3


-- The posts with titles that start with the word "The"
SELECT * FROM posts
  WHERE title LIKE 'The %'
;

-- Posts with IDs of 3,5,7, and 9
SELECT * FROM posts
  WHERE id IN (3, 5, 7, 9)
;

-- List authors who have written more than 3 comedy posts
SELECT authors.first_name, COUNT(posts.author_id) AS num_posts
FROM authors JOIN posts ON authors.id = posts.author_id
JOIN categories ON categories.id = posts.category_id
WHERE categories.name = "comedy"
GROUP BY posts.author_id
HAVING num_posts >= 3

-- Most written category by authors_age < 30
SELECT category.name, COUNT(posts.category_id) as num_posts
FROM categories JOIN posts ON categories.id = posts.category_id
JOIN authors ON authors.id = posts.user_id
WHERE authors.birthdate > CURRENT_DATE - 30*365
GROUP BY posts.category_id
ORDER BY num_posts DESC
LIMIT 1

-- Author who wrote the Longest post in 2016
SELECT authors.first_name
FROM authors JOIN posts ON authors.id = posts.author_id
WHERE posts.created_at > '2016-1-1'
ORDER BY LENGTH(posts.body) DESC;
LIMIT 1

