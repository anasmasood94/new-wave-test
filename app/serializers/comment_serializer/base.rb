module CommentSerializer
  class Base < ActiveModel::Serializer
    attributes :id, :comment, :commentor_name

    def commentor_name
      object.commentor.name
    end
  end
end
