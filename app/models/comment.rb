class Comment < ActiveRecord::Base
  def posted_on
    self.created_at.strftime("Postado em %H:%M %d/%m/%Y")
  end
end
