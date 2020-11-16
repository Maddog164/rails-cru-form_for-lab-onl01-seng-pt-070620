class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        # binding.pry
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
	end

	def new
		@song = Song.new
	end

    def create
    #   binding.pry
      @song = Song.new(song_params(:name))
      @song.save
    #   binding.pry
	  redirect_to song_path(@song)
	end

	def update
	  @song = Song.find(params[:id])
	  @song.update(song_params(:name))
	  redirect_to song_path(@song)
	end

	def edit
	  @song = Song.find(params[:id])
	end

	private

	def song_params(*args)
		params.require(:song).permit(*args)
	end

end