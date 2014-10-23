def run
  
  display_question
  email = get_user_email
  user = find_user(email)
  present_options
  choice = get_choice
  
  short_url = create_url(user) if choice == 0
  short_url = get_short_url unless !!short_url
  visit_url(user, short_url)
    
end

def display_question
  puts "Input your email:"
end

def get_user_email
  gets.chomp #can insert validations later
end

def find_user(email)
  User.where(email: email)
end

def present_options
  puts "What do you want to do?"
  puts "0. Create shortened URL\n1. Visit shortened URL"
end

def get_choice
  begin
    input = gets.chomp.to_i
  end until [0,1].include?(input)
  input
end

def create_url(user)
  puts "Type in your long url"
  long_url = gets.chomp
  ShortenedUrl.create_for_user_and_long_url!(user, long_url)
end

def get_short_url
  puts "Type in shortened URL"
  gets.chomp
end

def visit_url(user, short_url)
  Visit.record_visit!(user, short_url)
  long_url = ShortenedUrl.where(short_url: short_url).select(:long_url)
  Launchy.open(long_url)
end

run