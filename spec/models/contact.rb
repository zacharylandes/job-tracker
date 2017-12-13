require 'rails_helper'

describe Contact do

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        contact = Contact.new()
        expect(contact).to be_invalid
      end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Contact.new(na: "Dropbox")
      expect(comment).to respond_to(:company)
    end
  end
end
end
