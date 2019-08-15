require_relative('./models/star')
require_relative('./models/movie')
require_relative('./models/casting')

require('pry')

Star.delete_all
Movie.delete_all


star1 = Star.new('first_name' => 'Samuel', 'last_name' => 'Jackson')
star2 = Star.new('first_name' => 'Bruce', 'last_name' => 'Willis')
star3 = Star.new('first_name' => 'Margot', 'last_name' => 'Robbie')
star1.save()
star2.save()
star3.save()


movie1 = Movie.new('title' => 'Pulp Fiction', 'genre' => 'crime' )
movie2 = Movie.new('title' => 'Wolf Of Wall Street', 'genre' => 'crime' )
movie3 = Movie.new('title' => '51st State', 'genre' => 'crime' )
movie1.save
movie2.save
movie3.save

casting1 = Casting.new('movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 5000000)
casting1.save

binding.pry
nil
