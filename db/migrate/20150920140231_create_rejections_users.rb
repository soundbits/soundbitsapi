class CreateRejectionsUsers < ActiveRecord::Migration
  def change
    create_table :rejections_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :episode, index: true
    end
  end
end
