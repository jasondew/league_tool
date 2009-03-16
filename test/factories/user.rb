Factory.define :user do |u|
  u.first_name "John"
  u.last_name  "Smith"
  u.email      "jason.dew@gmail.com"
  u.password   "password"
  u.password_confirmation "password"
end

Factory.define :active_user, :parent => :user do |u|
  u.state "active"
end

Factory.define :bronze_user, :parent => :active_user do |u|
  u.plan Plan.find_by_name("Bronze")
end

Factory.define :silver_user, :parent => :active_user do |u|
  u.plan Plan.find_by_name("Silver")
end

Factory.define :gold_user, :parent => :active_user do |u|
  u.plan Plan.find_by_name("Gold")
end

Factory.define :platinum_user, :parent => :active_user do |u|
  u.plan Plan.find_by_name("Platinum")
end
