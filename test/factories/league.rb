Factory.define :league do |f|
  f.name "My League"
  f.association :owner, :factory => :bronze_user
end
