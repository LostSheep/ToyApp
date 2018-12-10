# freeze string literal: true

# User view model.
class User
  attr_accessor :first_Name, :last_Name, :email
  
  # Init user
  def initialize(attributes = {})
    @first_name  = attributes[:first_name]
    @last_name = attributes[:last_name]
    @email = attributes[:email]
  end
  
  # Get user's full name.
  def full_name
    "#{@first_name} #{last_Name}"
  end
  
  # Get last and first name seperated by a ', '.
  def alphabetical_name
    "#{@last_Name}, #{@first_name}"
  end
  
  # Show user name email relation.
  def formatted_email
    "#{full_name} <#{email}"
  end
end
