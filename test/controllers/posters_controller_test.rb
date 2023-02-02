require "test_helper"

class PostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poster = posters(:one)
  end

  test "should get index" do
    get posters_url
    assert_response :success
  end

  test "should get new" do
    get new_poster_url
    assert_response :success
  end

  test "should create poster" do
    assert_difference("Poster.count") do
      post posters_url, params: { poster: { name: @poster.name, score: @poster.score } }
    end

    assert_redirected_to poster_url(Poster.last)
  end

  test "should show poster" do
    get poster_url(@poster)
    assert_response :success
  end

  test "should get edit" do
    get edit_poster_url(@poster)
    assert_response :success
  end

  test "should update poster" do
    patch poster_url(@poster), params: { poster: { name: @poster.name, score: @poster.score } }
    assert_redirected_to poster_url(@poster)
  end

  test "should destroy poster" do
    assert_difference("Poster.count", -1) do
      delete poster_url(@poster)
    end

    assert_redirected_to posters_url
  end
end
