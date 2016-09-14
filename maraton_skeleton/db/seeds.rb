user1 = User.create(name: 'Vane', email: 'van@correo.com', password:'lalala')
user2 = User.create(name: 'Karla', email: 'karla@correo.com', password:'lalala')

#Preguntas de Paises
card1 = Card.create(question: '¿En qué país se encuentra la torre de Pisa?', answer:'Italia', fake_answer1: 'España', fake_answer2: 'Grecia')
card2 = Card.create(question: 'A las personas de cual país le llaman cariocas?', answer:'Brasil', fake_answer1:'Rusia', fake_answer2:'Polonia')
card3 = Card.create(question: 'En cual país queda la famosa Torre Eiffel?', answer:'Francia', fake_answer1:'Reino Unido', fake_answer2:'Canada')
card4 = Card.create(question: 'En cual país le llaman catiras a las mujeres rubias?', answer: 'Venezuela', fake_answer1:'EUA', fake_answer2:'México')
card5 = Card.create(question: 'Cual es la nación mas pequeña del mundo entero?', answer: 'Vaticano', fake_answer1:'Luxemburgo', fake_answer2:'Filipinas')

#Preguntas Cultura General
card6 = Card.create(question:'Cuales son las notas musicales?', answer:'Do, re, mi, fa, sol, la, si', fake_answer1:'Ich, Ni, San', fake_answer2:'Rap, Rep, Rip')
card7 = Card.create(question:'Que es un mitómano?', answer:' Persona con manía de mentir', fake_answer1:' Persona con manía de llorar', fake_answer2:' Persona con manía de reir')
card8 = Card.create(question:'Cuantos años tiene un lustro?', answer:'5', fake_answer1:'10', fake_answer2:'50')
card9 = Card.create(question:'Que cantidad de huesos tiene en total el ser humano?', answer:'206', fake_answer1:'160', fake_answer2:'300')
card10 = Card.create(question:'En que se especializa la cartografía? ', answer:'En mapas', fake_answer1:'En árboles', fake_answer2:'En animales')

#Preguntas Disney
card11 = Card.create(question:'¿Cual es el hechizo que utiliza la hada madrina de Cenicienta? ', answer:'bibidi babidi bu', fake_answer1:'chiquiti chititu', fake_answer2:'Risiti risitu')
card12 = Card.create(question:'¿Por que le crece la nariz a Pinocho? ', answer:'Por decir mentiras', fake_answer1:'Por robar', fake_answer2:'Por no ir a la escuela')
card13 = Card.create(question:'¿En que año crearon a Mickey Mouse? ', answer:'1928', fake_answer1:'1979', fake_answer2:'2014')
card14 = Card.create(question:'Como se llama el dragon que ayuda a Mulan?', answer:'Mushu', fake_answer1:'Cricri', fake_answer2:'Roshi')
card15 = Card.create(question:'Cómo se llama el vaquero de Toy Story', answer:'Woody', fake_answer1:'Buzz', fake_answer2:'Lilo')

deck1 = Deck.create(name:'Paises')
deck2 = Deck.create(name:'Cultura General')
deck3 = Deck.create(name:'Disney')

deck1.cards << card1
deck1.cards << card2
deck1.cards << card3
deck1.cards << card4
deck1.cards << card5

deck2.cards << card6
deck2.cards << card7
deck2.cards << card8
deck2.cards << card9
deck2.cards << card10

deck3.cards << card11
deck3.cards << card12
deck3.cards << card13
deck3.cards << card14
deck3.cards << card15