# README

###1. Build a new Rails app
```ruby
rails new practice_db
```

###2. Create and migrate a Users table with :name and :email columns.
```ruby
rails g model User name:string email:string
rails db:migrate
```

###3. Make a new migration to add a :nickname column to the table and run it.
```ruby
rails g migration add_nickname_to_users nickname:string
rails db:migrate
```

###4. Make a new migration to add a Posts table with :title and :body and run it.
```ruby
rails g model Post title:string body:text
rails db:migrate
```

###5. Make a new migration to add a foreign key to your Posts table so a user can have many posts and run it.
```ruby
rails g migration add_nickname_to_users nickname:string
```

###1. Make a new migration to add an index to this foreign key.
```ruby
rails g migration add_nickname_to_users nickname:string
```
###1. Examine your migrations history with rake db:migrate:status
```ruby
rails g migration add_nickname_to_users nickname:string
```
###1. Roll back the latest migrations and re-check the history
```ruby
rails g migration add_nickname_to_users nickname:string
```
###1. Roll back all migrations to the beginning.
```ruby
rails g migration add_nickname_to_users nickname:string
```
###1. Play with migrating and rolling back.
```ruby
rails g migration add_nickname_to_users nickname:string
```
###1. Now play with modifying migration files and trying to roll them back after they've been run. Play with running Ruby code in your ###1. migrations.
```ruby
rails g migration add_nickname_to_users nickname:string
```
###1. Keep playing until you're comfortable migrating in all directions and what the implications are of changing a migration.
```ruby
rails g migration add_nickname_to_users nickname:string
```