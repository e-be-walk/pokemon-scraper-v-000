class Pokemon
  attr_accessor :id, :name, :type, :hp, :db,

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id:array[0][0], name:array[0][1], type:array[0][2], hp:array[0][3], db: db)
  end

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def alter_hp(new_hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', new_hp, self.id)
  end
end
