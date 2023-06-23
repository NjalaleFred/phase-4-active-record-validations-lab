class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :title_not_clickbaity

    def title_not_clickbaity
        clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
        unless title.present? && clickbait_phrases.any? { |phrase| title.include?(phrase) }
            errors.add(:title, "must contain either 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'")
        end
    end
      
end
