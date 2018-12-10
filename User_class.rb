# freeze string literal: true

# User view model.
class User
  attr_accessor :firstName, :lastName, :email
  
  # Init user
  def initialize(attributes = {})
    @firstName  = attributes[:firstName]
    @lastName = attributes[:lastName]
    @email = attributes[:email]
  end
  
  # Get user's full name.
  def full_name
    "#{@firstName} #{lastName}"
  end
  
  # Get last and first name seperated by a ', '.
  def alphabetical_name
    "#{@lastName}, #{@firstName}"
  end
  
  # Show user name email relation.
  def formatted_email
    "#{full_name} <#{email}"
  end
end
