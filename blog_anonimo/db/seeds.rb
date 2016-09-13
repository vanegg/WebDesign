post1 = Post.create(title:"Hola Mundo", body:"Buenos dias")
post2 = Post.create(title:"Risa", body: "Jajaja")
post3 = Post.create(title:"SunnyDay", body:"Hoy es un buen día")

tag1 = Tag.create(name: "hola")
tag2 = Tag.create(name: "yolo")
tag3 = Tag.create(name: "nopainnogain")
tag4 = Tag.create(name: "lol")

post1.tags << tag1
post1.tags << tag2

post2.tags << tag3
post2.tags << tag4

post3.tags << tag1

