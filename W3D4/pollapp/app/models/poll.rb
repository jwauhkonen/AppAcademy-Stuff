class Poll < ActiveRecord::Base
  
  validates :title, :author_id, presence: true
  validates :title, uniqueness: true
  
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  has_many(
    :questions,
    class_name: "Question",
    foreign_key: :poll_id,
    primary_key: :id
    )
    
    
  def completed_polls
  
    questions_per_poll = Poll.find_by_sql(["
      SELECT p.* , COUNT(q.id) AS count
      FROM polls p
      JOIN questions q
      ON q.poll_id = p.id
      WHERE q.poll_id = ?
      GROUP BY p.title
      ", self.id])
      
      questions_per_poll.map { |quest| [quest.title, quest.count] }

  end
end
