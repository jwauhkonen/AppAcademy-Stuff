class Reply
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    new_reply = results.find { |result| result['id'] == id }
    
    Reply.new(new_reply)
  end
  
  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    new_replies = results.select { |result| result['question_id'] == question_id }
    
    
    new_replies.map  { |el| Reply.new(el) }
  end
  
  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    new_replies = results.select { |result| result['user_id'] == user_id }
    
    
    new_replies.map  { |el| Reply.new(el) }
  end
  
  
  
  attr_accessor :id, :body, :question_id, :parent_id, :user_id
  
  def initialize(options = {})
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
  end
  
  def author
    User.find_by_id(@user_id)  
  end
  
  def question
    Question.find_by_id(@question_id)
  end
  
  def parent_reply
    return nil if @parent_id.nil?
    Reply.find_by_id(@parent_id)
  end
  
  def child_replies
    
    replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT *
    FROM replies
    WHERE parent_id = ?
    SQL
    
    replies.map { |reply| Reply.new(reply) }
  end
  
  
  
  
  
end