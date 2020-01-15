class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :validate_release_year
    validates :title, uniqueness: {scope: :release_year }


    def validate_release_year
     
        if (self.released && !self.release_year) or (release_year and (release_year > Time.now.year))
            
            errors.add(:release_year, "If album is released, must have valid release year")

        end 

       

    end 


end
