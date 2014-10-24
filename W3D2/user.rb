class User
  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute('SELECT * FROM users')
    new_user = results.find do |result| 
      result['lname'] == lname && result['fname'] == fname
    end
    
    User.new(new_user)
  end
 
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM users')
    new_user = results.find { |result| result['id'] == id }
    
    User.new(new_user)
  end
  
  attr_accessor :id, :fname, :lname
  
  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
	
  end
  
  def save
    if @id
      QuestionsDatabase.execute(<<-SQL, attrs.merge({ id: id }))
        UPDATE
          users
        SET
          fname = :fname, lname = :lname
        WHERE
          users.id = :id
      SQL
    else
      QuestionsDatabase.execute(<<-SQL, attrs)
        INSERT INTO
          users (fname, lname)
        VALUES
          (:fname, :lname)
      SQL
      
      @id = QuestionsDatabase.last_insert_row_id
    end
    self
  end
      
  
  def authored_questions
    Question.find_by_author(@id)
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
  
  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end
  
  def average_karma
    
    average = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT 
      COUNT(DISTINCT(q.id)), COUNT(l.id)
    FROM
      questions q
    LEFT OUTER JOIN
      question_likes l
    WHERE
      q.user_id = ?
    AND
      l.id IS NOT NULL
    GROUP BY 
      q.id;
    SQL
    
    average
    
  end
  
end