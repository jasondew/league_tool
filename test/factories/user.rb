Factory.define :user do |f|
  f.first_name "John"
  f.last_name "Smith"
  f.sequence(:email) {|n| "jason.dew+user#{n}@gmail.com" }
  f.password "password"
  f.password_confirmation "password"

  f.availabilities {|u| [Factory.build(:availability), Factory.build(:availability), Factory.build(:availability), Factory.build(:availability), Factory.build(:availability)] }
end

Factory.define :active_user, :parent => :user do |u|
  u.state "active"
end

Factory.define :bronze_user, :parent => :active_user do |u|
  u.plan { Plan.find_by_name("Bronze") }
end

Factory.define :silver_user, :parent => :active_user do |u|
  u.plan { Plan.find_by_name("Silver") }
end

Factory.define :gold_user, :parent => :active_user do |u|
  u.plan { Plan.find_by_name("Gold") }
end

Factory.define :platinum_user, :parent => :active_user do |u|
  u.plan { Plan.find_by_name("Platinum") }
end
