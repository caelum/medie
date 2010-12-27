require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Medie::Json do
  
  context "when looking up the handler" do
  
    it "should accept pure application/json" do
      Medie::Json.new.can_handle?("application/json").should be_true
    end

    it "should not accept anything else" do
      Medie::Json.new.can_handle?("application/json2").should be_false
    end

    it "should accept profiles and options" do
      Medie::Json.new.can_handle?("application/json;profile=client").should be_true
    end

  end
  
  context "when unmarshalling" do
    
    it "should return an empty hash if its empty" do
      result = Medie::Json.new.unmarshal(nil)
      result.should be_empty
      result.should be_kind_of(Hash)
      result.should be_kind_of(Methodize)
      result.should be_kind_of(Medie::LinkedJson)
    end
    
  end
  
end
