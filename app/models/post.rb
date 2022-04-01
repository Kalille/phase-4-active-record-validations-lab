class Post < ApplicationRecord

validates :title, presence: true
validates :content, length:{minimum: 250}
validates :summary, length:{maximum: 250}
validates :category, inclusion:{in: ["Fiction", "Non-Fiction"]}
validate :click_bait


BAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]


  def click_bait
    if BAIT.none?{
        |value| value.match title
    } 
    errors.add(:title, "must be clickbait")
end

  end
end
