class AddPostToPostComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :post_comments, :post, foreign_key: true
  end
end
