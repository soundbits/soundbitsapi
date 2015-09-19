class CreateEpisodesUsers < ActiveRecord::Migration
  def change
    create_table :episodes_users do |t|

      t.belongs_to :user, index: true
      t.belongs_to :episode, index: true
    end
  end
end
