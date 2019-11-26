require 'pry'

class TitleValidator < ActiveModel::Validator
    def validate(record)
        if record.title == nil
            nil
        elsif !(record.title.include?("Won't Believe")||record.title.include?("Secret")||record.title.match?(/Top\s\d/)||record.title.include?("Guess"))
            record.errors[:title] << "Your title is not clickbaity enough!"
        end
    end
end