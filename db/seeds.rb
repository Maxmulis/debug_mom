require "open-uri"

puts "Creating some seeds"

Ticket.destroy_all
User.destroy_all


ticket1 = Ticket.new(description:"Just can't connect to the internet in my house. Typing from my phone… did I delete part of internet? Can you help me out please?")
ticket2 = Ticket.new(description:"I used to have really big letters and images which were very easy to read, now I cant get back to having that kind of view, can you help me to get that kind of view back?")
ticket3 = Ticket.new(description:"Hey,so I’m new to facebook, but everytime I want to use it, I need to type my password and username. My neighbour goes to it directly, can you show me how to do that?")
ticket4 = Ticket.new(description:"My son helped me to order sneakers online and he used my credit card information. I’m afraid that somebody has my personal information…need help with securing my data!")# This file should contain all the record creation needed to seed the database with its default values.
ticket5 = Ticket.new(description: "I cant find Micheles number in my contact list and I have deleted the kids as well...I can't live life this...")

user1 = User.create(username:"beatriz", email:"help@me.com")
user2 = User.create(username:"mucho_trabajo", email:"ajudame@perfavor.de")
user3 = User.create(username:"no_intiendo_nada", email:"embarasada@.it")
user4 = User.create(username: "Kiki", email:"youloco@gmail.com")
user5 = User.create(username: "Marion", email:"nocantdo@yahoo.com")

ticket1.mom = user1
ticket2.mom = user2
ticket3.mom = user3
ticket4.mom = user4
ticket5.mom = user5

puts "created 5 tickets"

file = URI.open("https://www.cepro.com/wp-content/uploads/2018/10/ParksTechIssues_large-1200x650.jpg")
ticket1.photos.attach(io: file, filename: 'ticket1.png', content_type: 'image/jpg')
ticket1.save

file = URI.open("https://cdn.powerofpositivity.com/wp-content/uploads/2015/09/woman-crying-tissue-1200x900.jpg")
ticket2.photos.attach(io: file, filename: 'ticket2.png', content_type: 'image/jpg')
ticket2.save

file = URI.open("https://cdn0.iconfinder.com/data/icons/life-skill-flat-self-improvement/512/problem_solving-512.png")
ticket3.photos.attach(io: file, filename: 'ticket3.png', content_type: 'image/png')
ticket3.save

file = URI.open("https://themerkle.com/wp-content/uploads-new/2017/01/shutterstock_388053706.jpg")
ticket4.photos.attach(io: file, filename: 'ticket4.png', content_type: 'image/jpg')
ticket4.save

file = URI.open("https://i.insider.com/5c8936d026c84b24b711d224?width=1100&format=jpeg&auto=webp")
ticket5.photos.attach(io: file, filename: 'ticket5.png', content_type: 'image/jpg')
ticket5.save

puts "attached photos to a 5 tickets"

