class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_click_baity?

    def is_click_baity?
        if !title.nil? && !title.include?( "Won't Believe" || "Secret" || "Top" || "Guess" )
            errors.add(:title, "must be clickbait")
        end 
    end 
end
