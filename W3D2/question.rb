class Question
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    new_question = results.find { |result| result['id'] == id }
    Question.new(new_question)
  end
  
  def self.find_by_author(author_id)
    results = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    found_questions = results.select { |result| result['user_id'] == author_id }
    
    found_questions.map { |el| Question.new(el)  }
  end
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end
  
  attr_accessor :id, :title, :body, :user_id
  
  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end
  
  def author
    User.find_by_id(@user_id)
  end
  
  def replies
    Reply.find_by_question_id(@id)
  end
  
  def followers
    QuestionFollow.followers_for_question_id(@id)
  end
end
