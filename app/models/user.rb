class User < ActiveRecord::Base
  has_and_belongs_to_many :episodes
  has_and_belongs_to_many :rejections, class_name: "Episode", join_table: "rejections_users"

  def suggestions
    Episode.random_sample(10)
  end
end
