class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lexique
  attr_accessible :content, :validated_at
end
