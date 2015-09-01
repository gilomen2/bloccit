require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @post = Post.new(title: 'Post title', body: 'This is the post body')
    end
    it "only allows -1 or 1 as values" do
      @post.votes.create(value: 1)
      expect(@post.points).to eq(1)

      @post.votes.create(value: -1)
      expect(@post.points).to eq(0)

      @post.votes.create(value: 3)
      expect(@post.points).to eq(0)

      @post.votes.create(value: -3)
      expect(@post.points).to eq(0)
    end
  end
end
