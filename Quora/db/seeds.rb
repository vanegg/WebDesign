user1 = User.create(name: "Vane", email: 'van@correo.com', password: 'lalala')
user2 = User.create(name: "Karla", email: 'karla@correo.com', password: 'lalala')
user3 = User.create(name: "Maryel", email: 'maryel@correo.com', password: 'lalala')

question1 = Question.create(text: "What is the most motivational movie ever you have seen?")
answer1 = Answer.create(text:"Hachiko")
answer2 = Answer.create(text:"La vita e bella")

question2 = Question.create(text: "What is your favorite flavor?")
answer3 = Answer.create(text:"Chocolate")
answer4 = Answer.create(text:"Lemon")

vote1 = Vote.create()
vote2 = Vote.create()
vote3 = Vote.create()
vote4 = Vote.create()

user1.questions << question1
user2.questions << question2

question1.answers << answer1
question1.answers << answer2

question2.answers << answer3
question2.answers << answer4

question1.votes << vote1
question2.votes << vote2
answer1.votes << vote3
answer4.votes << vote4

user2.votes << vote1
user3.votes << vote2
user3.votes << vote3
user1.votes << vote4

user1.answers << answer4
user2.answers << answer1
user2.answers << answer3
user3.answers << answer2
