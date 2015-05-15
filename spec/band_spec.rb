require('spec_helper')
describe(Band) do
  it('has many venues') do
    test_band = Band.create(:name => 'ACDC')
    venue1 = test_band.venues.create(:name => "Venue1")
    venue2 = test_band.venues.create(:name => "Venue2")
    expect(test_band.venues()).to(eq([venue1, venue2]))
  end
end
