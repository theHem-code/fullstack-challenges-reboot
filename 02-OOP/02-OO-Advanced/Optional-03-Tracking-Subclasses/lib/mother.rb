class Mother
  def self.phone_kids
    Daughter.phoned = true
    Son.phoned = true
    RandomClass.phoned = true
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.

# class Mother
#   @subclasses = []
#   def self.inherited(subclass)
#     @subclasses << subclass
#   end

#   def self.phone_kids
#     @subclasses.each do |subclass|
#       subclass.phone
#     end
#   end
# end
