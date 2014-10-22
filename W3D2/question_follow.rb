class QuestionFollow
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM question_followers')
    new_follow = results.find { |result| result['id'] == id }
    
    QuestionFollow.new(new_follow)
  end
  
  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT 
      u.id, u.fname, u.lname
    FROM 
      question_followers q_f
    JOIN
      users u
    ON
      q_f.user_id = u.id
    WHERE
      q_f.question_id = ?;
    SQL
    
    followers.map { |follower| User.new(follower) }
  end
  
  def self.followed_questions_for_user_id(user_id)
    questions =  QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      q.id, q.title, q.body, q.user_id
    FROM
      question_followers q_f
    JOIN
      questions q
    ON
      q_f.question_id = q.id
    WHERE
      q_f.user_id = ?;
    SQL
    
    questions.map { |question| Question.new(question) }      
  end
  
  def self.most_followed_questions(n)
    questions =  QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT 
      q.id, q.title, q.body, q.user_id
    FROM
      questions q
    JOIN
      (SELECT 
        question_id, COUNT(user_id) followers
      FROM
        question_followers
      GROUP BY 
        question_id
      ORDER BY
        followers DESC
      LIMIT ?) p
    ON
      q.id = p.question_id;
      SQL
    p questions
    questions.map { |question| Question.new(question) }
  end
  
  
  
  attr_accessor :id, :question_id, :user_id
  
  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end