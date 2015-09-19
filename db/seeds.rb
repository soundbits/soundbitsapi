# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(first_name: "stuart", last_name: "lynn")

u.episodes  << Episode.create(
                :podcast => "This American Life",
                :full_name => "567: What's Going On In There?",
                :description => "Most of the time, our idle curiosity about peculiar things around us goes unexplored. This week we open the door and try to make sense of what you see when you actually look inside. A teenage ...",
                :podcast_image_url => "http://www.thisamericanlife.org/sites/all/themes/thislife/images/logo-v5.png",
                :audio_url => "http://hackathon-audio.thisamericanlife.org/audio/505/505.mp3",
                :audio_length => 1000,
                :excerpt_text => "This is a bunch of text",
                :episode_duration => 200,
                :start_time=> 20,
                :end_time => 22
            )


u.episodes  << Episode.create(
                :podcast => "This American Life",
                :full_name => "566: The Seven Things You're Not Supposed to Talk About",
                :description => "Producer Sarah Koenig's mother lives by a set of rules about conversation. She has an actual list of off-limits topics, including how you slept, your period, your health, your diet and more. You don't talk about these things, she says, because nobody cares. This week we try to find stories on these exact topics that will prove her wrong.",
                :podcast_image_url => "http://www.thisamericanlife.org/sites/all/themes/thislife/images/logo-v5.png",
                :audio_url => "http://hackathon-audio.thisamericanlife.org/audio/566/566.mp3",
                :audio_length => 1000,
                :excerpt_text => "Some things about stuff",
                :episode_duration => 200,
                :start_time=> 27,
                :end_time => 29
            )


Episode.create(
                :podcast => "This American Life",
                :full_name => "564: Episode 564",
                :description => "This is Episode 564",
                :podcast_image_url => "http://www.thisamericanlife.org/sites/all/themes/thislife/images/logo-v5.png",
                :audio_url => "http://hackathon-audio.thisamericanlife.org/audio/564/564.mp3",
                :audio_length => 1000,
                :excerpt_text => "Episode 564",
                :episode_duration => 200,
                :start_time=> 27,
                :end_time => 29
)


Episode.create(
                :podcast => "This American Life",
                :full_name => "563: Episode 563",
                :description => "This is Episode 563",
                :podcast_image_url => "http://www.thisamericanlife.org/sites/all/themes/thislife/images/logo-v5.png",
                :audio_url => "http://hackathon-audio.thisamericanlife.org/audio/563/563.mp3",
                :audio_length => 1000,
                :excerpt_text => "Episode 563",
                :episode_duration => 200,
                :start_time=> 27,
                :end_time => 33
)


Episode.create(
                :podcast => "This American Life",
                :full_name => "562: Episode 562",
                :description => "This is Episode 562",
                :podcast_image_url => "http://www.thisamericanlife.org/sites/all/themes/thislife/images/logo-v5.png",
                :audio_url => "http://hackathon-audio.thisamericanlife.org/audio/562/562.mp3",
                :audio_length => 1000,
                :excerpt_text => "Episode 562",
                :episode_duration => 200,
                :start_time=> 30,
                :end_time => 33
)
