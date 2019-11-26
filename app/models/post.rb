# class Post < ActiveRecord::Base
#     validates :title, presence: true
#     validates :content, length: {in: 50..500}
#     validates :summary, length: {maximum: 500}
#     validates :category, inclusion: {in: %w(fiction non-fiction)}
#     # validate :is_clickbait?


# #     CLICKBAIT_PATTERNS = [
# #     /Won't Believe/i,
# #     /Secret/i,
# #     /Top [0-9]*/i,
# #     /Guess/i
# #   ]


# #     def is_clickbait?
# #         if CLICKBAIT_PATTERNS.none? {|cb| cb.match title }
# #         errors.add(:title, "must be clickbait")
# #         end
# #     end
# end
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?
  
    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
  
    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end
  end