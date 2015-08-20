class Train < ActiveRecord::Base

  has_many :arrivals , :class_name => "Arrival", :foreign_key => "train_id"

  def arrives_at_str
    arrives_at.strftime("%l:%M%P")
  end

end
