Factory.define :league do |f|
  f.name "My League"
  f.association :user, :factory => :user
end
