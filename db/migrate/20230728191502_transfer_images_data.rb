class TransferImagesData < ActiveRecord::Migration[7.0]
  def change
  end
  def up
    Post.find_each do |post|
      post.images.create(url: post.image) if post.image.present?
    end
  end
end
