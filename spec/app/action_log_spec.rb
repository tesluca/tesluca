require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
describe ActionLog do
  
  describe "when sane" do
    before do
      @client = Cassandra.new('tesluca_test', '127.0.0.1:9160')
    end
    
    it "should start out with an empty keyspace (this is a setup hook in spec helper)" do
      result = @client.get "action_logs", "1"
      result.size.must_equal 0
    end
    
    it "should allow posting a query via the raw Cassandra gem" do
      @client.insert("action_logs", "1", {"user_clicked_button" => 
                    { SimpleUUID::UUID.new => "note about clicking"}
      })
      result = @client.get "action_logs", "1"  
      button_clicks = result["user_clicked_button"]
      button_clicks[button_clicks.keys.last].must_equal "note about clicking"
    end
  end
  
  it "should query by time and user action"
end
