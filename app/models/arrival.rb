class Arrival < ActiveRecord::Base

  validates :train_id, :presence => true
  validate :unique_date_train_id
  validates :platform, :presence => true

  belongs_to :train , :class_name => "Train", :foreign_key => "train_id"

  def unique_date_train_id

    dates_for_train_id = []
    Arrival.all.each do |arr|
      if arr.train_id == train_id
        dates_for_train_id.push(arr.created_at.to_date)
      end
    end

    if dates_for_train_id.include? Date.today
      errors.add(:platform,'already added for that train today')
    end
  end

end
