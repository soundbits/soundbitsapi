class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|

      t.string    :podcast
      t.string    :full_name
      t.string    :description
      t.string    :podcast_image_url
      t.string    :audio_url
      t.string    :audio_length
      t.string    :excerpt_text
      t.string    :episode_duration
      t.integer   :start_time
      t.integer   :end_time

      t.timestamps null: false
    end
  end
end
