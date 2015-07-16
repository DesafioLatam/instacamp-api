class Capture < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :user
end
