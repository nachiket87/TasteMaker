puts "Destroying Questions"
Question.destroy_all if Rails.env.development?
