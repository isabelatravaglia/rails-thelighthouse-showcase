class Ahoy::Store < Ahoy::DatabaseStore
  def authenticate(data)
    # disables automatic linking of visits and users
  end
end

# set to true for JavaScript tracking
Ahoy.api = false

# set to true for geocoding
# we recommend configuring local geocoding first
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = false
Ahoy.mask_ips = true
Ahoy.cookies = false

