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
  
  def authored_questions
    Question.find_by_author(@id)
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
end