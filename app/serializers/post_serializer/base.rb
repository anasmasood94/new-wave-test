module PostSerializer
  class Base < ActiveModel::Serializer
    attributes :id, :title, :description
  end
end
