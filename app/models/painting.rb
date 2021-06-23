class Painting < ActiveRecord::Base
  belongs_to :artist
  validates :title, :image, presence: true
  # validates :slug, uniqueness: true # may need to comment

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end
end