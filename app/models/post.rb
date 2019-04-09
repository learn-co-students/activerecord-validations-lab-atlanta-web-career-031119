class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be either Fiction or Non-Fiction" }
    # validate :title_must_be_catchy

    # def title_must_be_catchy
    #     if title.present?
    #         if title.include?("Won't Believe")
    #             return true
    #         elsif title.include?("Secret")
    #             return true
    #         elsif title.include?("Top")
    #             return true
    #         elsif title.include?("Guess")
    #             return true
    #         else
    #             return false
    #         end
    #     end
    # end
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
