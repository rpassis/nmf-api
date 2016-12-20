namespace :gtfs do

  GTFS_FILE_PATH = './full_greater_sydney_gtfs_static.zip'

  desc 'Process the GTFS ZIP files in the app root folder'
  task import: :environment do    
    @source = GTFS::Source.build(GTFS_FILE_PATH, {strict: false})
    clean_up
    process_agencies
    process_routes
    process_trips
    process_stop_times
  end

  private

  def process_agencies
    @source.each_agency { |a| Agency.create(id: a.agency_id, name: a.agency_name, \
                        url: a.agency_url, timezone: a.agency_timezone, \
                        lang: a.agency_lang, phone: a.agency_phone) }      
    puts "Finished processing agencies"
  end

  def process_routes
    @source.each_route { |r| Route.create(id: r.route_id, agency_id: r.agency_id, \
                                   short_name: r.route_short_name, 
                                   long_name: r.route_long_name, of_type: r.route_type, \
                                   desc: r.route_desc, url: r.route_url, \
                                   color: r.route_color, text_color: r.route_text_color) }
    puts "Finished processing routes"
  end

  def process_trips
    @source.each_trip do |t| 
      Trip.create(id: t.trip_id, route_id: t.route_id, \
                  service_id: t.service_id, headsign: t.trip_headsign, \
                  short_name: t.trip_short_name, direction_id: t.direction_id, \
                  block_id: t.block_id, shape_id: t.shape_id, \
                  wheelchair_accessible: t.wheelchair_accessible, \
                  bikes_allowed: t.bikes_allowed)
    end
    puts "Finished processing trips"
  end

  def process_stop_times
    @source.each_stop_time do |s| 
      StopTime.create(id: SecureRandom.hex, trip_id: s.trip_id, \
                      arrival_time: s.arrival_time, \
                      departure_time: s.departure_time, stop_id: s.stop_id, \
                      sequence: s.stop_sequence, headsign: s.stop_headsign, \
                      pickup_type: s.pickup_type, drop_off_type: s.drop_off_type, \
                      shape_dist_travelled: s.shape_dist_traveled)
    end
    puts "Finished processing stop times"
  end

  def clean_up
      Agency.delete_all
      Route.delete_all
      Trip.delete_all
      StopTime.delete_all
  end

end
