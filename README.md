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
rails g migration add_foreignkey_to_posts

class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer
  end
end
rails db:migrate
```

###6. Make a new migration to add an index to this foreign key.
```ruby
rails g migration add_index_for_foreignkey_in_posts

class AddIndexForForeignkeyInPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts, :user_id
  end
end
```
###7. Examine your migrations history with rake db:migrate:status
```ruby
rails db:migrate:status

database: /Users/Deepak/Developer/viking/demo/practice_db/db/development.sqlite3

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20160828024339  Create users
   up     20160828024738  Add nickname to users
   up     20160828024915  Create posts
   up     20160828030428  Add user id to posts
   up     20160828040310  Add index for foreignkey in posts
```

###8. Roll back the latest migrations and re-check the history
```ruby
rails db:rollback
rails db:migrate:status

database: /Users/Deepak/Developer/viking/demo/practice_db/db/development.sqlite3

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20160828024339  Create users
   up     20160828024738  Add nickname to users
   up     20160828024915  Create posts
   up     20160828030428  Add user id to posts
  down    20160828040310  Add index for foreignkey in posts
```

###9. Roll back all migrations to the beginning.
```ruby
rails db:rollback STEP=4

 Status   Migration ID    Migration Name
--------------------------------------------------
  down    20160828024339  Create users
  down    20160828024738  Add nickname to users
  down    20160828024915  Create posts
  down    20160828030428  Add user id to posts
  down    20160828040310  Add index for foreignkey in posts
```

###10. Play with migrating and rolling back.
```ruby
rails db:migrate
rails db:rollback STEP=3
rails db:migrate
```

###11. Now play with modifying migration files and trying to roll them back after they've been run. Play with running Ruby code in your migrations.
```ruby
class AddIndexForForeignkeyInPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts, :user_id
    change_column :posts, :user_id, :integer, null: false
  end
end
rails db:migrate
```

###12. Keep playing until you're comfortable migrating in all directions and what the implications are of changing a migration.
```ruby
class AddDefaultTextToPosts < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :body, :text, default: "Hello There"
  end
end
rails db:migrate
```