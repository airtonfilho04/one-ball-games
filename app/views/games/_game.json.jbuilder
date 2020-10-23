json.extract! game, :id, :name, :description, :platforms, :genres, :publishers, :developers, :release_date, :score, :created_at, :updated_at
json.url game_url(game, format: :json)
