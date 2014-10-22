class QuestionLike
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
    new_like = results.find { |result| result['id'] == id }
    
    QuestionLike.new(new_like)
  end
  
  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT 
      u.id, u.fname, u.lname
    FROM
      users u
    JOIN
      question_likes q
    ON
      u.id = q.user_id
    WHERE
      q.question_id = ?;
    SQL
    
    likers.map { |liker| User.new(liker) }
  end
  
  def self.num_likes_for_question_id(question_id)
    
    count = QuestionsDatabase.instance.execute(<<-SQL, question_id) 
    SELECT
      COUNT(user_id)
    FROM
      question_likes
    WHERE
      question_id = ?;
    SQL
    
    count.shift.values.shift
    
  end
  
  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT 
      *
    FROM
      questions q
    JOIN (
      SELECT 
        question_id
      FROM
        question_likes
      WHERE
        user_id = ?) q2
    ON
    q.id = q2.question_id;
    SQL
    p liked_questions
    liked_questions.map { |question| Question.new(question) }
    
  end
  
  attr_accessor :id, :question_id, :user_id
  
  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
