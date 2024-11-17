# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'open posts page' do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test 'redirect to new post page' do
    visit posts_url
    click_link 'New Post'

    assert_selector "h1", text: "New post"

    fill_in "Body", with: @post.body
    fill_in "Title", with: @post.title
    click_on "Create Post"
    assert page.has_content?(@post.title)
  end

  test 'edit and update post' do
    visit post_path(@post)
    find_link('Edit',class: 'btn').click
    fill_in "Title", with: 'New title'
    click_on 'Update Post'
    assert page.has_content?('New title')
    assert page.has_content?(@post.body)
  end

  test 'delete post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end
    assert_text "Post was successfully destroyed"
  end

end
# END
