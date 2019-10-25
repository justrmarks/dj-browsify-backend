class SongsController < ApplicationController

  def create
    puts params
    artist = params[:artist]
    genre = params[:genre]
    user = User.get_by_username(params[:username])
    name = params[:name]
    file = params[:audio_file]
    song = Song.new({artist: artist, genre: genre, name: name })
    song.user = user
    song.song_file.attach(file)

    if song.save
      data = {
        name: song.name,
        artist: song.artist,
        genre: song.genre,
        path: url_for(song.song_file)
      }
      render json: {message: 'success', data: data}
    else
      render json: {message: 'failure', errors: song.errors}
    end

  end

  def destroy
    id = params[:id]
    song = Song.destroy(id)
    render json: {
        id: song.id,
        name: song.name,
        artist: song.artist,
        genre: song.genre,
        path: url_for(song.song_file)
      }
  end

  def get_by_user
    # user = User.find_by(email: params[:username])
    user = User.get_by_username(params[:username])
    songData = user.songs.map {|song|
      {
        id: song.id,
        name: song.name,
        artist: song.artist,
        genre: song.genre,
        path: url_for(song.song_file)
      }
    }

      render json: {message: 'success',data: songData }
  end

end
