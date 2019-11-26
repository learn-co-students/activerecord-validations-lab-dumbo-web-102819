class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}
	validate :check_click_bait?

	def check_click_bait?
		puts "Self: #{self} and also title: #{self.title}"
		clickbaits = [ "Won't Believe", "Secret", "Top", "Guess", "True Facts" ]

        if clickbaits.include?(self.title)
        	errors.add(:title, "#{self.title} is a clickbait.")
        end
	end
end
