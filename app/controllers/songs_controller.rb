class SongsController < ApplicationController
    def create
        
        @song = Song.new(song_params(:artist_name, :genre, :title, :released, :release_year))
        if @song.save
            redirect_to(@song)
        else 
            render :new
        end 


  
    end
    
    def new 

        @song = Song.new

    end 

    def show

        @song = Song.find(params[:id])



    end 

    def index

        @songs = Song.all

    end 

    def destroy

        Song.find(params[:id]).destroy
        redirect_to(songs_path)
    end 

    def update

        @song = Song.find(params[:id])
        if @song.update(song_params(:artist_name, :genre, :title, :released, :release_year))
            redirect_to(@song)
        else
            render :edit
        end 

    end 

    def edit 

        @song = Song.find(params[:id])

    end 

    private 

    def song_params(*args)

     params.require('song').permit(*args)
     
    end 
end
