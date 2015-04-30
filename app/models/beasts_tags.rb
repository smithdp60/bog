class BeastsTags < ActiveRecord::Base
  belongs_to :beast
  belongs_to :tag
end
