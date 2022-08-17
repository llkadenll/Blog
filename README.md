# ✳️ Blog Project

Blog application made for educational purpose to learn basic features of Ruby On Rails. You can watch it live on [Heroku](https://vast-beach-21113.herokuapp.com/). Most of the functions are available for registered users. To make it simpler you can use the following account: <br>

Email: user@gmail.com <br>
Password: qwerty

# Screenshots
<img src="screenshots/1.png" width="49%"> <img src="screenshots/2.png" width="49%">
<img src="screenshots/3.png" width="49%"> <img src="screenshots/4.png" width="49%">
<img src="screenshots/5.png" width="49%"> <img src="screenshots/6.png" width="49%">

## 🙌 Features

- Users can register, create posts and share them or keep them private
- Posts might have its categories. You can see them in the 'Categories' tab
- You can read your posts and public posts of other users
- You can edit and delete only your posts
- The website uses pagination
- Use search bar to search posts by the content of their title, body or author
- 👇 When you create a new post there's async validation system to let you know about errors in real time
<img src="screenshots/async_validation.png" width="70%">

## 🛠 Technologies
- HTML
- CSS
- Bootstrap
- JS
- Ruby on Rails
- PostgreSQL

## 👉 Launching
Install gems:
```
bundle install
```
Migrate the database:
```
rails db:migrate
```
Seed the database:
```
rails db:seed
```
Run the application:
```
rails s
```

## 🚨 Tests

To run tests:
```
rspec
```
