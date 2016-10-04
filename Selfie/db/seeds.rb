user1 = User.create(name: "Vane", email: 'van@correo.com', password: 'lalala')
user2 = User.create(name: "Karla", email: 'karla@correo.com', password: 'lalala')
user3 = User.create(name: "Maryel", email: 'maryel@correo.com', password: 'lalala')

album1 = Album.create(title: "Tatuajes")

user1.albums << album1