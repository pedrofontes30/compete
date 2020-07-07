namespace :heats do
  desc "Creating Heats"
  task :create => :environment do
    competition_divisions = CompetitionDivision.all
    puts "Checking heats update of #{competition_divisions.size} competitions..."
    competition_divisions.each do |competition_division|
      CreateHeatsJob.perform_later(competition_division)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
