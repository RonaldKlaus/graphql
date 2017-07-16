Rating.delete_all
Movie.delete_all
User.delete_all

[["mrbigstuff", "Ronald", "Klaus"], ["derwildekaiser", "Daniel", "Puscher"], ["spacemonkey", "Arian", "Meidow"]].each do |username, first_name, last_name|
  User.create(username: username, first_name: first_name, last_name: last_name)
end

user_ids = User.pluck(:id)

["Matrix", "Pulp Fiction", "Godzilla", "Total Recall", "Fargo"].each.with_index do |title, index|
  movie = Movie.create!(title: title, user_id: user_ids[index % 3])
  Rating.create!(movie_id: movie.id, value: Random.rand(1..100), user_id: user_ids[(index + 1) % 3])
end
