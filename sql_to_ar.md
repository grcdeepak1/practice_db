
# Translate from SQL to Active Record
###1.
SELECT *
FROM
  users;
User.all
###2.
SELECT *
FROM
  users
WHERE
  user.id = 1;
User.find(2)
###3.
SELECT *
FROM
  posts
ORDER BY
  created_at DESC
LIMIT 1;
Post.order(:created_at => :desc).limit(1)
###4.
SELECT *
FROM
  users
JOIN
  posts
ON
  posts.author_id = users.id
WHERE
  posts.created_at >= '2014-08-31 00:00:00';
User.joins(:posts)
  .where('created_at >= 2014-08-31 00:00:00')
###5.
SELECT
  count(*)
FROM
  users
GROUP BY
  favorite_color
HAVING
  count(*) > 1;
User.select('COUNT(*) AS num_users')
  .group('favorite_color')
  .having('num_users > 1')


The most recently updated user
The oldest user (by age)
all the users
all posts sorted in descending order by date created