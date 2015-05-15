require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands/all') do
  @bands = Band.all()
  erb(:list_all_bands)
end

post('/bands/all') do
  band_name = params.fetch('band_name')
  new_band = Band.create({:name => band_name})
  @bands = Band.all()
  erb(:list_all_bands)
end

get('/delete_band/:id') do
  find_band = Band.find(params.fetch('id').to_i())
  find_band.delete()
  @bands = Band.all()
  erb(:list_all_bands)
end

get('/venues/all') do
  @venues = Venue.all()
  erb(:list_all_venues)
end

post('/venues/all') do
  venue_name = params.fetch('venue_name')
  new_venue = Venue.create({:name => venue_name})
  @venues = Venue.all()
  erb(:list_all_venues)
end

get('/delete_venue/:id') do
  find_venue = Venue.find(params.fetch('id').to_i())
  find_venue.delete()
  @venues = Venue.all()
  erb(:list_all_venues)
end

get('/venue/:id') do
  @bands = Band.all()
  @venue = Venue.find(params.fetch('id').to_i())
  erb(:bands_at_venue)
end

post('/venue/:id') do
  @venues = Venue.find(params.fetch('id').to_i())
  band_id = params.fetch('add_band_to_venue').to_i()
  band = Band.find(band_id)
  @venue.bands.push(band)
  @bands = Band.all()
  erb(:bands_at_venue)
end

get('/band/:id') do
  @venues = Venue.all()
  @band = Band.find(params.fetch('id').to_i())
  erb(:venues_for_bands)
end

post('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  venue_id = params.fetch('add_venue_to_band').to_i()
  venue = Venue.find(venue_id)
  @band.venues.push(venue)
  @venues = Venue.all()
  erb(:venues_for_bands)
end

post('/band/:id/update') do
  @band = Band.find(params.fetch('id').to_i())
  band_name = params.fetch('update_band_name')
  @band.update({:name => band_name})
  erb(:update_band_name)
end
