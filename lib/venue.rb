class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:upcase_name)

  private

  define_method(:upcase_name) do
    self.name=(name().capitalize())
  end
end
