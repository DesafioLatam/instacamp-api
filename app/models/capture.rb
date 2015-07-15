class Capture < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
