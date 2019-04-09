class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: {minimum: 250}
validates :summary, length: {maximum: 250}
validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
#validates :title, inclusion: {in: %w(Won't Believe Secret Top [number])}
validate :is_clickbait?



 private


 def is_clickbait?
   if title != nil && title.include?("You Won't" || "Secret" || "Top" || "Guess")
   return
   else

     errors.add(:title,"That is not a clickbait worthy title. try again.")

 end
end


end 
