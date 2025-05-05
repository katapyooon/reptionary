Devise.setup do |config|
    # Other configurations...
  
    # Add a pepper to devise's password hashing
    config.pepper = 'a_secure_random_string_here'
end