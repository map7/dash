class Access < ApplicationRecord
  belongs_to :user
  belongs_to :app
  encrypts :password
end
