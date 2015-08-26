class Arrival < ActiveRecord::Base

  validate :unique_date_train_id

  validates :train_id, :presence => true
  validates :platform, :presence => true

  belongs_to :train , :class_name => "Train", :foreign_key => "train_id"

  def unique_date_train_id

    #if new entry, must be unique train_id for today's date
    #if editing entry, must be unique train_id for created_at date

    dates_for_train_id = []
    Arrival.all.each do |arr|
      #find all created_at dates for train_id
      if arr.train_id == train_id && arr[:id] != id
        dates_for_train_id.push(arr.created_at.in_time_zone("Central Time (US & Canada)").to_date)
      end
    end

    if Arrival.all.any? { |h| h.id == id }
      arr = Arrival.find(id)
      if dates_for_train_id.include? arr.created_at.in_time_zone("Central Time (US & Canada)").to_date
        errors.add(:platform,'already added for train')
      end
    else
      if dates_for_train_id.include? Date.today
        errors.add(:platform,'already added for train')
      end
    end
  end

end
