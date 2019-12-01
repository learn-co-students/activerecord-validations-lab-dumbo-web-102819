class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    validate :is_clickbait?

    CLICKBAIT_STUFF = [/Won't Believe/i, /Secret/i, /Top [Number]*/i, /Guess/i]
    def is_clickbait?
        if CLICKBAIT_STUFF.none? { |pattern| pattern.match title } 
        errors.add(:title, "must be clickbait")
        end
    end

end
