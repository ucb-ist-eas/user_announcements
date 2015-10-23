class User < ActiveRecord::Base
  
  def has_role?(role)
    return true if role.blank?
    
    (role == 'admin' && id == 1)
    
  end
end