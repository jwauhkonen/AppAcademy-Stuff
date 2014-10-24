# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(user_name: 'Jonny')
User.create!(user_name: 'Seany')
User.create!(user_name: 'Manny')
User.create!(user_name: 'Barry')
User.create!(user_name: 'Allen')
User.create!(user_name: 'Jory')

Poll.create!(title: '1967 Rock Albums', author_id: 1 )
Poll.create!(title: 'History of USA', author_id: 2)

Question.create!(text: 'What is the best of British Psychedelia?', poll_id: 1)
Question.create!(text: 'Which album has the best guitar playing?', poll_id: 1)
Question.create!(text: 'Which album has the best album cover?', poll_id: 1)

Question.create!(text: 'Who is your favorite President?', poll_id: 2)
Question.create!(text: 'Which president was the best saxaphonist?', poll_id: 2)
Question.create!(text: 'What is the most important event in US history?', poll_id: 2)

AnswerChoice.create!(text: 'Sgt. Peppers', question_id: 1)
AnswerChoice.create!(text: 'Piper at the Gates of Dawn', question_id: 1)
AnswerChoice.create!(text: 'Their Satanic Majesties Request', question_id: 1)

AnswerChoice.create!(text: 'Are You Experienced', question_id: 2)
AnswerChoice.create!(text: 'Disraeli Gears', question_id: 2)
AnswerChoice.create!(text: 'The Who Sell Out', question_id: 2)

AnswerChoice.create!(text: 'Forever Changes', question_id: 3)
AnswerChoice.create!(text: 'The Who Sell Out', question_id: 3)
AnswerChoice.create!(text: 'Their Satanic Majesties Request', question_id: 3)

AnswerChoice.create!(text: 'Thoedore Roosevelt', question_id: 4)
AnswerChoice.create!(text: 'ABRAHAM LINCOLN', question_id: 4)
AnswerChoice.create!(text: 'GEORGE WASHINGTON', question_id: 4)

AnswerChoice.create!(text: 'Bill Clinton', question_id: 5)
AnswerChoice.create!(text: 'Calvin Coolidge', question_id: 5)
AnswerChoice.create!(text: 'Woodrow Wilson', question_id: 5)

AnswerChoice.create!(text: 'Pearl Harbor', question_id: 6)
AnswerChoice.create!(text: 'The Battle of Gettysburg', question_id: 6)
AnswerChoice.create!(text: 'I Have a Dream Speech', question_id: 6)

Response.create!(user_id: 2, answer_id: 1)
Response.create!(user_id: 2, answer_id: 4)
Response.create!(user_id: 2, answer_id: 7)

Response.create!(user_id: 3, answer_id: 1)
Response.create!(user_id: 3, answer_id: 4)
Response.create!(user_id: 3, answer_id: 7)

Response.create!(user_id: 4, answer_id: 1)
Response.create!(user_id: 4, answer_id: 4)
Response.create!(user_id: 4, answer_id: 7)

Response.create!(user_id: 5, answer_id: 1)
Response.create!(user_id: 5, answer_id: 4)
Response.create!(user_id: 5, answer_id: 7)

Response.create!(user_id: 6, answer_id: 2)
Response.create!(user_id: 6, answer_id: 5)
Response.create!(user_id: 6, answer_id: 8)

Response.create!(user_id: 1, answer_id: 12)
Response.create!(user_id: 1, answer_id: 14)
Response.create!(user_id: 1, answer_id: 18)

Response.create!(user_id: 3, answer_id: 11)
Response.create!(user_id: 3, answer_id: 13)
Response.create!(user_id: 3, answer_id: 17)

Response.create!(user_id: 4, answer_id: 10)
Response.create!(user_id: 4, answer_id: 13)
Response.create!(user_id: 4, answer_id: 15)

Response.create!(user_id: 5, answer_id: 12)
Response.create!(user_id: 5, answer_id: 13)
Response.create!(user_id: 5, answer_id: 18)

Response.create!(user_id: 6, answer_id: 10)
Response.create!(user_id: 6, answer_id: 13)
Response.create!(user_id: 6, answer_id: 17)





