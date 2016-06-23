# An example for user of the template
class Example < ActiveRecord::Base
  belongs_to :user, inverse_of: :example
  validates :text, :user, presence: true
end
