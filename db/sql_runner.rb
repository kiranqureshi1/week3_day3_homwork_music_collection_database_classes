require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')


class SqlRunner

  def SqlRunner.run(sql, value = [])
    begin
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", value)
  ensure
    db.close if db != nil
  end
    return result
  end




end
