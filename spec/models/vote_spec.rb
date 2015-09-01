require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @post = Post.create(title: 'Post title', body: 'This is the post body')
    end
    it "only allows -1 or 1 as values" do
      v1 = @post.votes.create(value: 1)
      expect(v1.valid?).to eq(true)

      v2 = @post.votes.create(value: -1)
      expect(v2.valid?).to eq(true)

      v3 = @post.votes.create(value: 3)
      expect(v3.valid?).to eq(false)

      v4 = @post.votes.create(value: -3)
      expect(v4.valid?).to eq(false)
    end
  end
end
