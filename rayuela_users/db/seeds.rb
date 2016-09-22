player1 = Player.create(name: "VGG")
player2 = Player.create(name: "KSR")
player3 = Player.create(name: "GGM")

game1 = Game.create(result1: 12, result2: 30, winner: "Ganador: Jugador 1")
game2 = Game.create(result1: 45, result2: 8, winner: "Ganador: Jugador 2")
game3 = Game.create(result1: 10, result2: 10, winner: "Empate")


player1.games << game1
player2.games << game1

player1.games << game2
player3.games << game2

player2.games << game3
player3.games << game3

#Escrito de otra forma:
# game1.players << player1
# game1.players << player2

# game2.players << player1
# game2.players << player3

# game3.players << player2
# game3.players << player3