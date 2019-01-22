class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    return "#{first_name} #{last_name}"
  end

  def list_roles
    character_name = self.characters.select(:name).map(&:name)
    show_name = self.shows.select(:name).map(&:name)
    puts "#{character_name} - #{show_name}"
  end

end
