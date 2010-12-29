require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe Medie::FormUrlEncoded::Driver do
  context "when unmarshalling" do

    it "when passing not a hash, returns itself" do
      Medie::FormUrlEncoded::Driver.new.marshal("some content", "").should == "some content"
    end

    it "when passing a hash should concatenate" do
      params = {:user => "guilherme", :password => "my_pass"}
      marshalled_params = Medie::FormUrlEncoded::Driver.new.marshal(params, "")
      marshalled_params.should =~ /password=my_pass/
      marshalled_params.should =~ /user=guilherme/
      marshalled_params.should =~ /&/
    end

  end
end