class Arrival < ActiveRecord::Base

  validates :train_id, :presence => true, :uniqueness => { :scope => [:train_id ]}
  validates :platform, :presence => true

  belongs_to :train , :class_name => "Train", :foreign_key => "train_id"

end
