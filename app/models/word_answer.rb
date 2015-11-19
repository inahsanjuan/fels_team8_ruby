class WordAnswer < ActiveRecord::Base
	belongs_to :word, inverse_of: :word_answers
	has_many :lesson_words
	validates :content, presence: true
    validates :word, presence: true
end