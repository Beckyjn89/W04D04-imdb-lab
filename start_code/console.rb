require('pry')

require_relative('./db/sql_runner')
require_relative('./models/performer')
require_relative('./models/movie')
require_relative('./models/casting')

performer1 = Performer.new({'first_name' => 'Bruce', 'last_name' => 'Willis'})
performer1.save
performer2 = Performer.new({'first_name' => 'Ellen', 'last_name' => 'Page'})
performer2.save

performer2.first_name = 'Hellen'
performer2.update

performer3 = Performer.new({'first_name' => 'Alan', 'last_name' => 'Rickman'})
performer3.save

performer4 = Performer.new({'first_name' => 'Tom', 'last_name' => 'Cruise'})
performer4.save


movie1 = Movie.new({'title' => "Die Hard", 'genre' => 'comedy'})
movie1.save

movie1.title = "Die Hard 2"
movie1.update

movie2 = Movie.new({'title'=> 'Whip it', 'genre' => 'sports'})
movie2.save


movie3 = Movie.new({'title'=> 'Harry Potter', 'genre' => 'fantasy'})
movie3.save

movie4 = Movie.new({'title'=> 'Top Gun', 'genre' => 'crime'})
movie4.save


!!

casting1 = Casting.new({'movie_id'=> movie1.id, 'performer_id' => performer1.id, 'fee' => 20})
casting1.save

casting2 = Casting.new({'movie_id'=> movie2.id, 'performer_id' => performer2.id, 'fee' => 40})
casting2.save

casting3 = Casting.new({'movie_id'=> movie3.id, 'performer_id' => performer3.id, 'fee' => 40})
casting3.save

casting4 = Casting.new({'movie_id'=> movie1.id, 'performer_id' => performer3.id, 'fee' => 40})
casting4.save
casting5 = Casting.new({'movie_id'=> movie4.id, 'performer_id' => performer4.id, 'fee' => 40})
casting5.save

casting2.fee = 20
casting2.update

performer4.delete
movie4.delete
casting5.delete

binding.pry
nil
