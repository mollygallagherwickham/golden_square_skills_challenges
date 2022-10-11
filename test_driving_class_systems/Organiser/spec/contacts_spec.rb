require 'contacts'

RSpec.describe Contacts do
    it "returns empty array of numbers" do
        contact = Contacts.new
        expect(contact.list_numbers).to eq []
    end
end