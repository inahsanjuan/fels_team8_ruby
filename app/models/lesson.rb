class Lesson < ActiveRecord::Base
  has_many :lesson_words
  belongs_to :users
  belongs_to :category
  accepts_nested_attributes_for :lesson_words

  scope :filter_lesson, ->(user_id){where "user_id IN (#{followed_ids}) 
                                OR user_id = :user_id", user_id: user_id}
  
  private
  def create_word_lessons
    word_ids = category.words.order("RANDOM()").limit(20).map(&:id)
    self.word_ids = word_ids
  end
end
class Lesson < ActiveRecord::Base
end
