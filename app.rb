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
  @venue = Venue.find(params.fetch('id').to_i())
  band_id = params.fetch('add_band_to_venue').to_i()
  band = Band.find(band_id)
  @venue.bands.push(band)
  @bands = Band.all()
  erb(:bands_at_venue)
end
