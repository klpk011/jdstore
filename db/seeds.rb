u = User.new
u.email = "admin1@test.com"
u.password = "123123"
u.password_confirmation = "123123"
u.is_admin = true
u.save

100.times{ |i| Group.create( :name => "#{i} Group" ) }
100.times{ |i| Category.create( :name => "#{i} Category" ) }
