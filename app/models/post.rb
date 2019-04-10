class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction','Non-Fiction']}
    validate :clickbait?

    private

    def clickbait?
        if self.title.to_s.include?("Won't Believe")
            true
        elsif self.to_s.include?("Secret")
            true
        elsif self.to_s.include?("Top")
            true
        elsif self.to_s.include?("Guess")
            true
        else
            errors.add(:title, "not a clickbait!")
            return false
        end
    end
end
