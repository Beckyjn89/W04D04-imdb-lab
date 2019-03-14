require_relative('../db/sql_runner')
require_relative('./performer')

class Movie
  attr_reader :id
  attr_accessor :title, :genre
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save
    sql = 'INSERT INTO movies (title, genre) VALUES ($1, $2)
    RETURNING id'
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM movies'
    movies = SqlRunner.run(sql)
    return movies.map{|movie| Movie.new(movie)}
  end

    def update
      sql = 'UPDATE movies SET (title, genre) = ($1, $2) WHERE id = $3'
      values = [@title, @genre, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM movies WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)

    end


      def performers
        sql = 'SELECT performers.* FROM performers
          INNER JOIN castings
          ON castings.performer_id = performers.id
          WHERE movie_id = $1'
        values = [@id]
        performers = SqlRunner.run(sql, values)
        return performers.map{|performer| Performer.new(performer)}
      end

     def budget
      sql = 'SELECT SUM(castings.fee) FROM castings WHERE movie_id =
      $1'
      values = [@id]
      return @budget - SqlRunner.run(sql, values).first["sum"].to_i
    end
        #see options on the class notes as SQl version is most effective
      #sql bolt - learn sql
    end
