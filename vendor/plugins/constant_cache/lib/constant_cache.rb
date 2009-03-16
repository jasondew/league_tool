module ConstantCache

  def caches_constants field_name = 'name'
    all.each do |instance|
      name = instance.send(field_name)
      const = name.gsub(/[^A-Za-z]+/, '_').upcase

      const_set(const, instance) unless const_defined?(const)
    end
  end

end

ActiveRecord::Base.send(:extend, ConstantCache)
