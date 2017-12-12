require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new()
        expect(comment).to be_invalid
      end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(content: "Dropbox")
      expect(comment).to respond_to(:job)
    end
  end
end
end
