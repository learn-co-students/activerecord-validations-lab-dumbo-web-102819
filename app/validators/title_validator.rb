class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title 
            if record.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
                 true
            else 
                record.errors[:title] << "FIX YO TITLE"
            end 
        else 
            record.errors[:title] << "NIL CLASS? WTF"
        end 
        # if !(record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top") || record.title.include?("Guess") )
        #     record.errors[:title] << "Fix yo title"
        # end 
    end 
end 