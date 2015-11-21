class Word < ActiveRecord::Base
  belongs_to :category, inverse_of: :words
  has_many :word_answers, inverse_of: :word

  has_many :lesson_words, dependent: :destroy

  has_many :lessons, through: :lesson_words
  accepts_nested_attributes_for :lesson_words


  validates :content, presence: true, length: {maximum: 30}

  accepts_nested_attributes_for :word_answers, allow_destroy: true, 
                      reject_if: lambda {|word_answer| word_answer[:content].blank?}

end

