require 'csv'

desc "Load voter data"
task :vote => :environment do
  puts "Candidate information"
  CSV.foreach("data/Candidates.csv") do |row|
    if row[1].present?
      Candidate.create(:name => row[2])
    end
  end

  puts "Precinct information"
  CSV.foreach("data/Precincts.csv") do |row|
    if row[1].present?
      Precinct.create(:number => row[2], :description => row[4], :location => row[5])
    end
  end

  puts "Vote information"
  CSV.foreach("data/Votes.csv") do |row|
      if row[1].present?
        Vote.create(:precinct_id => row[2], :candidate_id => row[3], :votes => row[4])
      end
    end

end
