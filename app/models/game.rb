class Game
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :platforms, type: String
  field :genres, type: String
  field :publishers, type: String
  field :developers, type: String
  field :release_date, type: Date
  field :score, type: Float
  field :image, type: String
  mount_uploader :image, ImageUploader
end
