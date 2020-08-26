puts "Destroying Questions"
Question.destroy_all if Rails.env.development?


question1 = Question.create!(:link => "Just keep swimming", :answers => { correct: "Finding Nemo", incorrect: ["Frozen", "The Incredibles", "Jaws"] })
question2 = Question.create!(:link => "A million dollars isn't cool. You know what's cool? A billion dollars.", :answers => { correct: "The Social Network", incorrect: ["Steve Jobs", "The Founder", "The Wolf of Wall Street"] })
question3 = Question.create!(:link => "I'm king of the world!", :answers => { correct: "Titanic", incorrect: ["The Wolf of Wall Street", "Good Will Hunting", "The King's Speech"] })
question4 = Question.create!(:link => "I feel the need - the need for speed!", :answers => { correct: "Top Gun", incorrect: ["The Fast & The Furious", "Cars", "Iron Eagle"] })
question5 = Question.create!(:link => "The flower that blooms in adversity is the most rare and beautiful of all", :answers => { correct: "Mulan", incorrect: ["Frozen", "Tangled", "Pocahontas"] })
question6 = Question.create!(:link => "All it takes is faith and trust", :answers => { correct: "Peter Pan", incorrect: ["Santa Claus", "The Incredibles", "The Lion King"] })
question7 = Question.create!(:link => "Today is a good day to try", :answers => { correct: "The Hunchback of Notre Dame", incorrect: ["Frozen", "The Incredibles", "Moana"] })
question8 = Question.create!(:link => "Can anybody be happy if they aren’t free?", :answers => { correct: "Beauty & the Beast", incorrect: ["Frozen", "The Incredibles", "Jaws"] })
question9 = Question.create!(:link => "Giving up is for rookies", :answers => { correct: "Hercules", incorrect: ["Moana", "The Incredibles", "Pinocchio"] })
question10 = Question.create!(:link => "If you can’t say something nice, don’t say nothing at all", :answers => { correct: "Bambi", incorrect: ["The Hunchback of Notre Dame", "The Incredibles", "Tangled"] })

puts Question.all
puts "completed"