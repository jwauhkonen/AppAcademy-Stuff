class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  
  
  has_many(
    :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )
  
  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id
  )
  
  def responses_from_user
    responses_of_user = Response.result_by_sql(["
      SELECT u.* , COUNT(r.id) AS count
      FROM users u
      JOIN response r
      ON r.user_id = u.id
      WHERE u.id = ?
      ", self.id])
      
      responses_of_user.map { |response| [response.title, response.count] }
  end
  
  
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
