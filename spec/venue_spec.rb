require('spec_helper')
describe(Venue) do
  it('has many bands') do
    test_venue = Venue.create({:name => "Venue1"})
    band1 = test_venue.bands.create({:name => "band1"})
    band2 = test_venue.bands.create({:name => "band2"})
    expect(test_venue.bands()).to(eq([band1, band2]))
  end
  
end
