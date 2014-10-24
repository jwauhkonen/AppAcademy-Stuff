class Question < ActiveRecord::Base
  
  validates :text, :poll_id, presence: true
  
  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )
  
  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )
  
  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )
  
  def results
    acs = self.answer_choices.includes(:responses)
    
    response_counts = {}
    acs.each do |ac|
      response_counts[ac.text] = ac.responses.length
    end
        
    response_counts
  end
  
  def results_SQL
    response_counts = AnswerChoice.find_by_sql(["
      SELECT
        ac.*, COUNT(r.id) AS response_count
      FROM
        questions q
      JOIN 
        answer_choices ac
      ON
        ac.question_id = q.id
      LEFT OUTER JOIN
        responses r
      ON
        r.answer_id = ac.id
      WHERE
        ac.question_id = ?
      GROUP BY
        ac.id", self.id])
    result_hash = {}
    response_counts.map do |response|
      [response.text, response.response_count]
    end 
  end
  
  def results_final
    response_counts = self
      .answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS response_count")
      .joins('LEFT OUTER JOIN responses ON responses.answer_id = answer_choices.id')
      .group('answer_choices.id')
    result_hash = {}
    
    response_counts.each do |response|
      result_hash[response.text] = response.response_count
    end
    
    result_hash
  end
end
