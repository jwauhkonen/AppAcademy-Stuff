class Response < ActiveRecord::Base
  
  validates :user_id, :answer_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_respond_to_poll
  
  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_id,
    primary_key: :id
  )
  
  # has_one(
 #    :answer_choice,
 #    class_name: 'AnswerChoice',
 #    foreign_key: :answer_id,
 #    primary_key: :id
 #  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )
  
  def sibling_responses
    if self.persisted?
      self
        .question
        .responses
        .where('responses.id != ?', self.id)
    else
      self
        .question
        .responses
    end
  end
  
  def poll_author
      question
      .poll
      .author_id
  end
  
  private
  def respondent_has_not_already_answered_question
    unless sibling_responses.where('user_id = ?', self.user_id).empty?
      errors[:user] << 'already responded to this question'
    end
  end
  
  def author_cannot_respond_to_poll
    if poll_author == user_id
      errors[:user] << 'cannot respond to poll that they authored'
    end
  end
  
end
