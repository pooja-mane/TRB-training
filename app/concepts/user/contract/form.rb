module User::Contract
  class Form < Reform::Form
    property :name
    property :surname
    property :email

    # property :address, populate_if_empty: Address do
    #   property :line1
    #   property :city
    #   property :state

    #   validate :city, :state, presence: true
    # end

    validates :name, :email, :surname, presence: true
  end
end
