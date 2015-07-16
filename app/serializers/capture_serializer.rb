class CaptureSerializer < ActiveModel::Serializer
  attributes :id, :photo, :comment

  belongs_to :user
end
