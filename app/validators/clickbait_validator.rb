class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
        unless /Won't Believe|Secret|Guess|Top [0-9]*$/.match(record.title)
            record.errors[:title] << "Title is not clickbait-y"
        end
    end
end