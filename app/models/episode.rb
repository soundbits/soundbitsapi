class Episode < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.random_sample(no)
    no ||= 20
    self.limit(no).order("RANDOM()").all
  end
end
