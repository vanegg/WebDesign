user1 = User.create(name: "Vane", email: 'van@correo.com', password: 'lalala')
user2 = User.create(name: "Karla", email: 'karla@correo.com', password: 'lalala')
user3 = User.create(name: "Maryel", email: 'maryel@correo.com', password: 'lalala')

survey1 = Survey.create(name: "Favoritos")
survey2 = Survey.create(name: "Paises")

question1 = Question.create(text: "Cual es tu color favorito?")
question2 = Question.create(text: "Cual es tu animal favorito?")

question3 = Question.create(text: "A que país te gustaria ir más de Vacaciones?")
question4 = Question.create(text: "En que país te gustaría vivir?")
question5 = Question.create(text: "Cual es tu presupuesto para un boleto de avión?")

option1 = Option.create(text: "Azul")
option2 = Option.create(text: "Verde")
option3 = Option.create(text: "Blanco")

option4 = Option.create(text: "Perro")
option5 = Option.create(text: "Gato")
option6 = Option.create(text: "Ballena")

option7 = Option.create(text: "EUA")
option8 = Option.create(text: "Canada")
option9 = Option.create(text: "Argentina")

option10 = Option.create(text: "Chile")
option11 = Option.create(text: "Portugal")
option12 = Option.create(text: "Australia")

option13 = Option.create(text: "Menos de 10,000 pesos")
option14 = Option.create(text: "Entre 10,000 y 15,000 pesos")
option15 = Option.create(text: "Mas de 15,000 pesos")

user1.surveys << survey1
user2.surveys << survey2

survey1.questions << question1
survey1.questions << question2

survey2.questions << question3
survey2.questions << question4
survey2.questions << question5

question1.options << option1
question1.options << option2
question1.options << option3

question2.options << option4
question2.options << option5
question2.options << option6

question3.options << option7
question3.options << option8
question3.options << option9

question4.options << option10
question4.options << option11
question4.options << option12

question5.options << option13
question5.options << option14
question5.options << option15

response1 = Response.create()
option1.responses << response1
question1.responses << response1
survey1.responses << response1
user2.responses << response1

response2 = Response.create()
option4.responses << response2
question2.responses << response2
survey1.responses << response2
user2.responses << response2

response3 = Response.create()
option9.responses << response3
question3.responses << response3
survey1.responses << response3
user2.responses << response3

response4 = Response.create()
option11.responses << response4
question4.responses << response4
survey2.responses << response4
user1.responses << response4

response5 = Response.create()
option14.responses << response5
question5.responses << response5
survey2.responses << response5
user1.responses << response5