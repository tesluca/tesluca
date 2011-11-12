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
    
    it "should be an ActiveColumn class for talking with Cassandra" do
      ActionLog.new.must_be_kind_of ActiveColumn::Base
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
  
  it "should query by time and user action" do
    Tesluca::App.connect_to_cassandra("test")
    click_stream = ActionLog.new({
      "action_type" => "foo" #{ "string" => "note about clicking"}
    })
    
    click_stream.save
    result = ActionLog.find('action_type')
    result.count.must_equal 2
    # Tweet.find( { 'user_id' => 'all', 'recipient_id' => [ 'fsinatra', 'dmartin' ] }, :reversed => true, :count => 1 )
  end
end
