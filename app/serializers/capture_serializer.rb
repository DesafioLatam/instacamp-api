class CaptureSerializer < ActiveModel::Serializer
  attributes :id, :photo, :comment

  belongs_to :user

  def photo
    object.photo.url
  end

  def user
    object.user.email
  end
end
