namespace :dev do
  desc "Fill database with sample data"
  task :seed => :environment do
    Rake::Task['db:reset'].invoke
    make_agency
    make_route
    make_trip
    make_stop_time
  end
end

def make_agency
  10.times do |n|
    id = SecureRandom.uuid
    name = Faker::Name.first_name
    Agency.create!(id: id, name: name)                 
  end
end

def make_route
  Agency.all.each do |a|
    10.times { |n| Route.create!(id: SecureRandom.uuid, agency: a) }
  end
end

def make_trip
  Route.all.each do |r|
    10.times { |n| Trip.create!(id: SecureRandom.uuid, route: r) }
  end
end

def make_stop_time
  Trip.all.each do |t|
    10.times { |n| StopTime.create!(id: SecureRandom.uuid, trip: t) }
  end
end
