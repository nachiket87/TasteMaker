desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Deleting 'waiting' games older than 10 minutes"
  Game.delete_finished_games
  puts "done."
end
