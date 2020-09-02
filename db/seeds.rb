require "open-uri"

puts "Creating some seeds"

TicketCategory.destroy_all
Category.destroy_all
Ticket.destroy_all
User.destroy_all

phone = Category.new(name:"phone")
laptop = Category.new(name:"laptop")
internet = Category.new(name:"internet")

puts "creating tickets with categories"

ticket1 = Ticket.new(description:"Just can't connect to the internet in my house. Typing from my phone… did I delete part of internet? Can you help me out please?")
TicketCategory.create!(ticket: ticket1, category: internet)

ticket2 = Ticket.new(description: "My nephew was talking to his friend about seeing Blue Screen of Death on his laptop. Yesterday as I was to answer a call my phone suddenly died on me, the last thing I saw was a dark colored color on my screen. I hope its not the same thing my newphew was talking to his friend with, because honestly, the screen they were mentioning sounds horrible")
TicketCategory.create!(ticket: ticket2, category: laptop)

ticket3 = Ticket.new(description: "Hey,so I’m new to facebook, but everytime I want to use it, I need to type my password and username. My neighbour goes to it directly, can you show me how to do that? I asked her already to help, but she didnt know how to help me out. I guess its not that hard, but I dont know where is the button for it")
TicketCategory.create!(ticket: ticket3, category: internet)

ticket4 = Ticket.new(description: "My son helped me to order sneakers online and he used my credit card information. I’m afraid that somebody has my personal information…need help with securing my data!")# This file should contain all the record creation needed to seed the database with its default values.
TicketCategory.create!(ticket: ticket4, category: phone)

ticket5 = Ticket.new(description: "I cant find Micheles number in my contact list and I have deleted the kids as well...I can't live life this...")
TicketCategory.create!(ticket: ticket5, category: internet)

ticket6 = Ticket.new(description: "I used to have really big letters and images which were very easy to read, now I cant get back to having that kind of view, can you help me to get that kind of view back? ")
TicketCategory.create!(ticket: ticket6, category: phone)

ticket7 = Ticket.new(description: "My internet is really slow! Most of the time the internet on my phone is super fast and then when I enter my courtyard, it gets to be super slow. Can you help me to understand whats the deal with this?")
TicketCategory.create!(ticket: ticket7, category: laptop)

ticket8 = Ticket.new(description: "“My computer is running veryyy slow. Sometimes my computer decides to be very slow...I dont know why is that so, can we have a small chat to discuss this particular matter")
TicketCategory.create!(ticket: ticket8, category: phone)

ticket9 = Ticket.new(description: "My computer just shut down unexpectedly, and then I need to restart it, I dont know why this happens! ")
TicketCategory.create!(ticket: ticket9, category: laptop)

ticket10 = Ticket.new(description: "I deleted some important files, or I cant find them... not sure... I need your help!")
TicketCategory.create!(ticket: ticket10, category: internet)

puts "created tickets with categories"

puts "creating 10 moms and Marina and Max..."
user1 = User.create(username:"beatriz", email:"help@me.com")
user2 = User.create(username:"mucho_trabajo", email:"ajudame@perfavor.de")
user3 = User.create(username:"no_intiendo_nada", email:"embarasada@.it")
user4 = User.create(username: "Kiki", email:"youloco@gmail.com")
user5 = User.create(username: "Marion", email:"nocantdo@yahoo.com")
user6 = User.create(username:"beatriz", email:"help@me.com")
user7 = User.create(username:"mucho_trabajo", email:"ajudame@perfavor.de")
user8 = User.create(username:"no_intiendo_nada", email:"embarasada@.it")
user9 = User.create(username: "Kiki", email:"youloco@gmail.com")
user10 = User.create(username: "Marion", email:"nocantdo@yahoo.com")
max = User.create(username: "Max", email: "max@klauskeller.com")
marina = User.create(username: "Marina", email: "marinkato@gmail.com")

puts "Done!"
puts "Assigning tickets to moms..."

ticket1.mom = user1
ticket2.mom = user2
ticket3.mom = user3
ticket4.mom = user4
ticket5.mom = user5
ticket6.mom = user6
ticket7.mom = user7
ticket8.mom = user8
ticket9.mom = user9
ticket10.mom = user10

puts "Done!"

puts "Attaching pictures to tickets..."

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

file = URI.open("https://www.cepro.com/wp-content/uploads/2018/10/ParksTechIssues_large-1200x650.jpg")
ticket6.photos.attach(io: file, filename: 'ticket1.png', content_type: 'image/jpg')
ticket6.save

file = URI.open("https://cdn.powerofpositivity.com/wp-content/uploads/2015/09/woman-crying-tissue-1200x900.jpg")
ticket7.photos.attach(io: file, filename: 'ticket2.png', content_type: 'image/jpg')
ticket7.save

file = URI.open("https://cdn0.iconfinder.com/data/icons/life-skill-flat-self-improvement/512/problem_solving-512.png")
ticket8.photos.attach(io: file, filename: 'ticket3.png', content_type: 'image/png')
ticket8.save

file = URI.open("https://themerkle.com/wp-content/uploads-new/2017/01/shutterstock_388053706.jpg")
ticket9.photos.attach(io: file, filename: 'ticket4.png', content_type: 'image/jpg')
ticket9.save

file = URI.open("https://i.insider.com/5c8936d026c84b24b711d224?width=1100&format=jpeg&auto=webp")
ticket10.photos.attach(io: file, filename: 'ticket5.png', content_type: 'image/jpg')
ticket10.save

puts "Done!"
puts "--------------------------------"
puts "Seeds have been sowed, ready to Rock n' Roll!"
