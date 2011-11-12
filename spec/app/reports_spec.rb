require File.expand_path(File.dirname(__FILE__)) + "/../spec_helper.rb"
describe "sinatra app reports" do
  it "home page should return ok" do
    get '/' 
    "ok".must_equal last_response.body 
  end
end  

