class User < ActiveRecord::Base
  has_and_belongs_to_many :episodes

  def suggestions
    Episode.random_sample(10)
  end
end
