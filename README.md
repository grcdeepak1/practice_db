# README

###1. Build a new Rails app
```
rails new practice_db
```
###2. Create and migrate a Users table with :name and :email columns.
```ruby
rails g model User name:string email:string
```
###3. Make a new migration to add a :nickname column to the table and run it.
```
```
###4. Make a new migration to add a Posts table with :title and :body and run it.
###1. Make a new migration to add a foreign key to your Posts table so a user can have many posts and run it.
###1. Make a new migration to add an index to this foreign key.
###1. Examine your migrations history with rake db:migrate:status
###1. Roll back the latest migrations and re-check the history
###1. Roll back all migrations to the beginning.
###1. Play with migrating and rolling back.
###1. Now play with modifying migration files and trying to roll them back after they've been run. Play with running Ruby code in your ###1. migrations.
###1. Keep playing until you're comfortable migrating in all directions and what the implications are of changing a migration.
