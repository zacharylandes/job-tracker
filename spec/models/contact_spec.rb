require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "manager", email: "jo@joe.com")
        expect(contact).to be_invalid
      end
      it "is invalid without a position" do
        contact = Contact.new(name: "jo", email: "jo@joe.com")
        expect(contact).to be_invalid
      end
      it "is invalid without company" do
        contact = Contact.new(name:"jo",position: "manager", email: "jo@joe.com")
        expect(contact).to be_invalid
      end
      it "is invalid without email" do
        contact = Contact.new(name:"jo",position: "manager")
        expect(contact).to be_invalid
      end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Contact.new(name: "Dropbox")
      expect(comment).to respond_to(:company)
    end
  end
end
end
