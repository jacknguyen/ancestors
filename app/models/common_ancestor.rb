class CommonAncestor < ApplicationRecord
  belongs_to :parent, class_name: 'CommonAncestor', optional: true
end
