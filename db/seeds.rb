puts "Destroying Games, Questions and their child ... GameQuestions"
Game.destroy_all
GameQuestion.destroy_all
Question.destroy_all #if Rails.env.development?


question1 = Question.create!(:link => "378488802", :answers => { correct: "Joker", incorrect: ["It", "The Clown", "Batman and Robin"] })
question2 = Question.create!(:link => "18921085", :answers => { correct: "Inception", incorrect: ["Gravity", "The Founder", "Interstellar"] })
question3 = Question.create!(:link => "310248563", :answers => { correct: "The Wolf of Wall Street", incorrect: ["Gangs of New York", "Good Will Hunting", "The King's Speech"] })
question4 = Question.create!(:link => "128010494", :answers => { correct: "The Kingsman: The Secret Service", incorrect: ["The Kingsman: Golden Circle", "Hitman", "X-Men First Class"] })
question5 = Question.create!(:link => "267703426", :answers => { correct: "Ant Man and the Wasp", incorrect: ["Avengers", "X-Men", "Iron Man"] })
question6 = Question.create!(:link => "145470405", :answers => { correct: "21 Jump Street", incorrect: ["Step Up 2", "22 Jump Street", "Half Baked"] })
question7 = Question.create!(:link => "187284452", :answers => { correct: "John Wick 2", incorrect: ["John Wick", "Crash" , "Snatch"] })
question8 = Question.create!(:link => "968518", :answers => { correct: "The Shawshank Redemption", incorrect: ["The Green Mile", "The Firm", "1917"] })
question9 = Question.create!(:link => "4476521", :answers => { correct: "Fight Club", incorrect: ["Snatch", "Spy Game", "Fury"] })
question10 = Question.create!(:link => "291343442", :answers => { correct: "The Prestige", incorrect: ["The Dark Knight", "American Psycho", "Kate and Leopold"] })

#------------------#------#------#------#------#------#------#------#------#------#------#------#------#------

question11 = Question.create!(:link => "26022168", :answers => { correct: "Pulp Fiction", incorrect: ["Django Unchained", "Kill Bill", "Inglorious Basterds"] })
question12 = Question.create!(:link => "63394616", :answers => { correct: "Inglorious Bastards", incorrect: ["Hitler: Rise of Evil", "Saving Private Ryan", "Pearl Harbor"] })
question13 = Question.create!(:link => "33257142", :answers => { correct: "The Departed", incorrect: ["The Aviator", "Scarface", "Gangs of New York"] })
question14 = Question.create!(:link => "211088460", :answers => { correct: "Gladiator", incorrect: ["Centurion", "Ben-Hur", "Spartacus"] })
question15 = Question.create!(:link => "4944032", :answers => { correct: "Casino Royale", incorrect: ["Golden Eye", "Quantum of Solace", "Goldfinger"] })
question16 = Question.create!(:link => "134807219", :answers => { correct: "Anchorman 2", incorrect: ["Goodfellas", "Casino", "Anchorman"] })
question17 = Question.create!(:link => "226389040", :answers => { correct: "Pacific Rim 2", incorrect: ["Transformers", "Avengers", "Pacific Rim"] })
question18 = Question.create!(:link => "171201562", :answers => { correct: "The Matrix", incorrect: ["The Matrix Reloaded", "The Matrix Revolutions", "John Wick"] })
question19 = Question.create!(:link => "387343602", :answers => { correct: "La La Land", incorrect: ["Love Actually", "Crazy Stupid Love", "Due Date"] })
question20 = Question.create!(:link => "341993597", :answers => { correct: "Top Gun", incorrect: ["Mission Impossible", "Valkyrie", "Jerry Maguire"] })


#------------------#------#------#------#------#------#------#------#------#------#------#------#------#------

puts "Done! Completed"

#old questions

#question1 = Question.create!(:link => "44434997", :answers => { correct: "Finding Nemo", incorrect: ["Frozen", "The Incredibles", "Jaws"] })
#question2 = Question.create!(:link => "304925913", :answers => { correct: "The Social Network", incorrect: ["Steve Jobs", "The Founder", "The Wolf of Wall Street"] })
#question3 = Question.create!(:link => "66615298", :answers => { correct: "Titanic", incorrect: ["The Wolf of Wall Street", "Good Will Hunting", "The King's Speech"] })
#question4 = Question.create!(:link => "289488598", :answers => { correct: "Lord of the Rings", incorrect: ["The Fast & The Furious", "Cars", "Iron Eagle"] })
#question5 = Question.create!(:link => "119857523", :answers => { correct: "Mulan", incorrect: ["Frozen", "Tangled", "Pocahontas"] })
#question6 = Question.create!(:link => "35124119", :answers => { correct: "Planet of the Apes", incorrect: ["Santa Claus", "The Incredibles", "The Lion King"] })
#question7 = Question.create!(:link => "22612157", :answers => { correct: "Trainspotting", incorrect: ["The Departed", "Crash" , "Snatch"] })
#question8 = Question.create!(:link => "101315181", :answers => { correct: "The Imitation Game", incorrect: ["Hitler: Rise of Evil", "The Incredibles", "Jaws"] })
#question9 = Question.create!(:link => "3088877", :answers => { correct: "Office Space", incorrect: ["Moana", "The Incredibles", "Pinocchio"] })
#question10 = Question.create!(:link => "36364990", :answers => { correct: "Braveheart", incorrect: ["The Lost Kingdom", "Norsemen", "Kingdom of Heaven"] })
