require 'rails_helper'

describe Contact, type: :model do
  it {should belong_to(:company)}
end
