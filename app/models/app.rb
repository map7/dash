class App < ApplicationRecord
  has_many :accesses, dependent: :destroy
  encrypts :global_password
end
