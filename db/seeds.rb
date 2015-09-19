require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Episode.destroy_all

u = User.create(first_name: "stuart", last_name: "lynn")

episodes = File.read('db/ClipsSoundbits.csv')
csv = CSV.parse(episodes, :headers => true)

episodes = []
csv.each do |row|
  episodes << Episode.create( :podcast => row["podcast"],
                              :full_name => row["full_name"],
                              :description => row["description"],
                              :podcast_image_url => row["podcast_image_url"],
                              :audio_url => row["audio_url"],
                              :audio_length => row["audio_length"],
                              :excerpt_text  => row["excerpt_text"],
                              :episode_duration => row["episode_duration"],
                              :start_time  => row["start_time"],
                              :end_time  => row["end_time"],
                              )
end

episodes.sample(20).each{|e| u.episodes << e}
