class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end

    def artist_name
        self.artist ? self.artist.name : nil
    end

    def genre_id=(id)
        self.genre = Genre.find_by(id: id)
    end

    def note_contents=(contents)
        contents.each do |content|
            # Note.build(content: content, song_id: self.id)
            self.notes.build(content: content)
        end
    end


end
