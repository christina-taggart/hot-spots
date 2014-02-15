BANDNAMES = [ "Joy Division", "New Order", "The Smiths", "The Sisters of Mercy", "Wye Oak", "Thao and the Get Down Stay Down",
          "Siouxsie and the Banshees", "Interpol" ]

BANDNAMES.each{ |band_name| Band.create(name: band_name) }

user = User.new(email: 'andy@lee.com')
user.password = "password"
user.save

PLACES= [
  {
    name: 'chicago',
    lattitude: '41.850033',
    longitude: '-87.6500523'
  },
  {
    name: 'berlin',
    lattitude: '30',
    longitude: '25'
  }
]

PLACES.each do |p|
  place = Location.create(p)
  user.locations << place
  user.save
end
