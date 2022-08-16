user1 = User.create(email: 'user@gmail.com', password: 'qwerty')
user2 = User.create(email: 'dev@gmail.com', password: 'qwerty')

cat_lifestyle = Category.create(name: 'lifestyle', icon: "fa-bicycle", color: 'warning')
cat_sport = Category.create(name: 'sport', icon: "fa-futbol-o", color: 'danger')
cat_science = Category.create(name: 'science', icon: "fa-flask", color: 'primary')
cat_nature = Category.create(name: 'nature', icon: "fa-leaf", color: 'success')
cat_business = Category.create(name: 'business', icon: "fa-money", color: 'info')
cat_politics = Category.create(name: 'politics', icon: "fa-globe", color: 'secondary')

posts = [
  {title: 'My favourite football clubs', user: user2, category: cat_sport, public: true},
  {title: 'TOP 10 waterpolo players', user: user1, category: cat_sport, public: true},
  {title: 'Champions League is coming', user: user1, category: cat_sport, public: true},
  {title: 'How to improve public health service?', user: user1, category: cat_politics, public: true},
  {title: 'Left or right?', user: user2, category: cat_politics, public: true},
  {title: 'Electric engines explained', user: user1, category: cat_science, public: true},
  {title: 'Cats and their behaviors', user: user2, category: cat_nature, public: true},
  {title: 'Why we need more trees in cities?', user: user1, category: cat_nature, public: true},
  {title: 'Make more money working less hours', user: user1, category: cat_business, public: true},
  {title: 'How does real estate work?', user: user2, category: cat_business, public: true},
  {title: 'My favourite Nike shoes', user: user2, category: cat_lifestyle, public: true},
  {title: 'How to take care of your skin?', user: user1, category: cat_lifestyle, public: false},
  {title: 'TOP 5 destinations for holidays', user: user2, category: cat_lifestyle, public: true}
]

post_body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque semper nisl vel quam luctus ultricies. Nam et malesuada neque. Mauris fermentum rutrum nunc eget pulvinar. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas consectetur leo diam, quis bibendum est mollis eget. Cras ut sapien mattis, volutpat turpis vitae, gravida nisi. Pellentesque egestas consequat lorem at auctor. Donec sed ullamcorper nisi.
Nam lectus purus, commodo at tincidunt ut, vehicula ut risus. Vivamus venenatis lobortis tortor in interdum. Nullam ut massa commodo, placerat massa et, scelerisque neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce fringilla ullamcorper erat ut rhoncus. Donec tempus dolor ac ex efficitur mollis. Cras aliquam suscipit rutrum. Curabitur feugiat est at turpis maximus euismod.
In laoreet mi non laoreet pretium. Maecenas mattis lacus nibh, aliquam ornare elit aliquet ut. Quisque at tincidunt mi. Mauris vel ante ac elit hendrerit fringilla. Nullam placerat molestie rhoncus. Duis vitae faucibus felis. Nullam pretium tincidunt auctor. Curabitur aliquam auctor commodo"

posts.each do |post|
  Post.create(title: post[:title], body: post_body, user: post[:user], category: post[:category], public: post[:public])
end
