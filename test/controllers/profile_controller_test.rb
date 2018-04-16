require "test_helper"

describe ProfileController do
  it "should get index" do
    get profile_index_url
    value(response).must_be :success?
  end

end
