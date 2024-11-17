require "application_system_test_case"

class Post::CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:without_comments)
  end

  test "creating new comment" do
    comment = 'A new comment'
    visit post_url(@post)
    find('#post_comment_body').set(comment)
    click_on "Create Comment"
    assert_text 'Comment was successfully created.'
  end
end
