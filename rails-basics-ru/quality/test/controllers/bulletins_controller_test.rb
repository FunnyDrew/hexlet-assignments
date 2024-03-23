require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/bulletins'
    assert_response :success
  end

  test 'should get model' do
    bulletin = bulletins(:bulletin1)
    get bulletin_path(bulletins(:bulletin1))
    assert_response :success
    assert_select 'h1', bulletin.title
    assert_select 'p', bulletin.body
  end
end
