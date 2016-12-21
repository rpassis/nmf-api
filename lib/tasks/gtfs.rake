namespace :gtfs do

  SYDNEY_FERRIES_AGENCY_CODE        = "112"
  SYDNEY_FAST_FERRIES_AGENCY_CODE   = "306"
  SUBSCRIBED_AGENCIES               = [SYDNEY_FERRIES_AGENCY_CODE, SYDNEY_FAST_FERRIES_AGENCY_CODE]

  desc 'Process the GTFS ZIP files in the app root folder'
  task import: :environment do    
    @source = GTFS::Source.build('./full_greater_sydney_gtfs_static.zip', {strict: false})
    clean_up
    process
  end

  private

  def process
    source = @source.agencies.select { |a| SUBSCRIBED_AGENCIES.include? a.agency_id }
    agencies = []
    source.each do |a| 
      agency = Agency.new(id: a.agency_id, name: a.agency_name, \
                    url: a.agency_url, timezone: a.agency_timezone, \
                    lang: a.agency_lang, phone: a.agency_phone)   
      agencies << agency
    end
    Agency.import agencies, validate: false
    puts "Finished processing agencies"
    process_routes_for(agencies)
  end

  def process_routes_for(agencies)
    agency_ids = agencies.pluck(:id)
    source = @source.routes.select { |r| agency_ids.include? r.agency_id }
    routes = []
    source.each do |r| 
      route = Route.new(id: r.route_id, agency_id: r.agency_id, \
                      short_name: r.route_short_name, 
                      long_name: r.route_long_name, of_type: r.route_type, \
                      desc: r.route_desc, url: r.route_url, \
      color: r.route_color, text_color: r.route_text_color)
      routes << route
    end
    Route.import routes, validate: false
    puts "Finished processing routes"
    process_trips_for(routes)
  end

  def process_trips_for(routes)
    route_ids = routes.pluck(:id)
    source = @source.trips.select { |t| route_ids.include? t.route_id }
    trips = []
    source.each do |t| 
      trip = Trip.new(id: t.trip_id, route_id: t.route_id, \
                  service_id: t.service_id, headsign: t.trip_headsign, \
                  short_name: t.trip_short_name, direction_id: t.direction_id, \
                  block_id: t.block_id, shape_id: t.shape_id, \
                  wheelchair_accessible: t.wheelchair_accessible, \
                  bikes_allowed: t.bikes_allowed)
      trips << trip
    end
    Trip.import trips, validate: false
    puts "Finished processing trips"
    process_stop_times_for(trips)
  end

  def process_stop_times_for(trips)
    trip_ids = trips.pluck(:id)
    stop_times = []
    @source.each_stop_time do |s| 
      next unless trip_ids.include? s.trip_id
      stop_time = StopTime.new(id: SecureRandom.hex, trip_id: s.trip_id, \
                      arrival_time: s.arrival_time, \
                      departure_time: s.departure_time, stop_id: s.stop_id, \
                      sequence: s.stop_sequence, headsign: s.stop_headsign, \
                      pickup_type: s.pickup_type, drop_off_type: s.drop_off_type, \
                      shape_dist_travelled: s.shape_dist_traveled)
      stop_times << stop_time
    end
    StopTime.import stop_times, validate: false
    puts "Finished processing stop times"
  end

  def clean_up
      Agency.delete_all
      Route.delete_all
      Trip.delete_all
      StopTime.delete_all
  end

end
