
# Translate from SQL to Active Record
###1.
# SELECT *
# FROM
#   users;
User.all

###2.
# SELECT *
# FROM
#   users
# WHERE
#   user.id = 1;
User.find(2)

###3.
# SELECT *
# FROM
#   posts
# ORDER BY
#   created_at DESC
# LIMIT 1;
Post.order(:created_at => :desc).limit(1)

###4.
# SELECT *
# FROM
#   users
# JOIN
#   posts
# ON
#   posts.author_id = users.id
# WHERE
#   posts.created_at >= '2014-08-31 00:00:00';
User.joins(:posts)
  .where('created_at >= 2014-08-31 00:00:00')

###5.
# SELECT
#   count(*)
# FROM
#   users
# GROUP BY
#   favorite_color
# HAVING
#   count(*) > 1;
User.select('COUNT(*) AS num_users')
  .group('favorite_color')
  .having('num_users > 1')

###6.
# The most recently updated user
User.order(updated_at: :desc)

###7.
# The oldest user (by age)
User.order(:birthdate).limit(1)


###8.
# all the users
User.all

###9.
# all posts sorted in descending order by date created
Post.order(created_at: :desc)

###
###10.
# -- List authors who have written more than 3 comedy posts
# SELECT authors.first_name, COUNT(posts.author_id) AS num_posts
# FROM authors JOIN posts ON authors.id = posts.author_id
# JOIN categories ON categories.id = posts.category_id
# WHERE categories.name = "comedy"
# GROUP BY posts.author_id
# HAVING num_posts >= 3
Post.joins(:authors).joins(:categories)
  .select(authors.first_name, 'COUNT(*) AS num_posts')
  .where("categories.name = 'comedy'")
  .group(posts.author_id)
  .having('num_posts >= 3')

###11.
# -- Most written category by authors_age < 30
# SELECT category.name, COUNT(posts.category_id) as num_posts
# FROM categories JOIN posts ON categories.id = posts.category_id
# JOIN authors ON authors.id = posts.user_id
# WHERE authors.birthdate > CURRENT_DATE - 30*365
# GROUP BY posts.category_id
# ORDER BY num_posts DESC
# LIMIT 1
Post.joins(:authors).joins(:categories)
  .select(category.name, 'COUNT(posts.category_id) as num_posts')
  .where("authors.birthdate > CURRENT_DATE - 30*365")
  .group(posts.category_id)
  .order(num_posts => :desc)
  .limit(1)

###12.
# -- Author who wrote the Longest post in 2016
# SELECT authors.first_name
# FROM authors JOIN posts ON authors.id = posts.author_id
# WHERE posts.created_at > '2016-1-1'
# ORDER BY LENGTH(posts.body) DESC;
# LIMIT 1
Post.joins(:authors)
  .select(authors.first_name)
  .where("posts.created_at > '2016-1-1'")
  .order(length(posts.body) => :desc)
  .limit(1)
