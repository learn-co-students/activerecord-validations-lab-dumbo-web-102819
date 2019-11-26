class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction),
    message: "%{value} is not a valid category" }
    validate :is_clickbait?

    def is_clickbait?
        clickbait_titles = [ "Won't Believe", "Secret", "Top", "Guess", "True Facts" ]
        if clickbait_titles.include?(self.title)
            errors.add(:title, "%{value} is clickbait")
        end 
    
    end 

end
