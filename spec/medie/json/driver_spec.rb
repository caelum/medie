require 'spec_helper'

describe Medie::Json::Driver do
  
  context "when looking up the handler" do
  
    it "should accept pure application/json" do
      Medie::Json::Driver.new.can_handle?("application/json").should be_true
    end

    it "should not accept anything else" do
      Medie::Json::Driver.new.can_handle?("application/json2").should be_false
    end

    it "should accept profiles and options" do
      Medie::Json::Driver.new.can_handle?("application/json;profile=client").should be_true
    end

  end
  
  context "when unmarshalling" do
    
    it "should return an empty hash if its empty" do
      result = Medie::Json::Driver.new.unmarshal(nil)
      result.should be_empty
      result.should be_kind_of(Hash)
      result.should be_kind_of(Methodize)
      result.should be_kind_of(Medie::Linked)
    end
    
    it "should return the unmarshalled json hash enhanced" do
      result = Medie::Json::Driver.new.unmarshal({"name" => "guilherme"}.to_json)
      result.should == {"name" => "guilherme"}
      result.should be_kind_of(Hash)
      result.should be_kind_of(Methodize)
      result.should be_kind_of(Medie::Linked)
    end
    
  end
  
  context "when marshalling" do
    
    it "should return itself if its a string" do
      result = Medie::Json::Driver.new.marshal("guilherme", nil)
      result.should == "guilherme"
    end
    
    it "should return the unmarshalled json hash enhanced" do
      result = Medie::Json::Driver.new.marshal({"name" => "guilherme"}, nil)
      result.should == {"name" => "guilherme"}.to_json
    end
    
  end
  
end
