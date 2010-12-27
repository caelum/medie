require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Medie::Xml do
  
  context "when looking up the handler" do
  
    it "should accept pure application/xml" do
      Medie::Xml.new.can_handle?("application/xml").should be_true
    end

    it "should not accept anything else" do
      Medie::Xml.new.can_handle?("application/xml2").should be_false
    end

    it "should accept profiles and options" do
      Medie::Xml.new.can_handle?("application/xml;profile=client").should be_true
    end

  end
  
  context "when unmarshalling" do
    
    it "should return an empty hash if its empty" do
      result = Medie::Xml.new.unmarshal(nil)
      result.should be_empty
      result.should be_kind_of(Hash)
      result.should be_kind_of(Methodize)
      result.should be_kind_of(Medie::XmlLinked)
    end
    
    it "should return the unmarshalled Xml hash enhanced" do
      result = Medie::Xml.new.unmarshal("<name>guilherme</name>")
      result.should == {"name" => "guilherme"}
      result.should be_kind_of(Hash)
      result.should be_kind_of(Methodize)
      result.should be_kind_of(Medie::XmlLinked)
    end
    
  end
  
  context "when marshalling" do
    
    it "should return itself if its a string" do
      result = Medie::Xml.new.marshal("guilherme", nil)
      result.should == "guilherme"
    end
    
    it "should return the unmarshalled Xml hash enhanced" do
      lambda { Medie::Xml.new.marshal({"name" => "guilherme"}, nil) }.
        should raise_error("Trying to marshal a string into xml does not make sense: 'nameguilherme'")
    end
    
    it "should return the unmarshalled Xml hash enhanced" do
      hash = {"name" => {"first" => "guilherme"}}
      result = Medie::Xml.new.marshal(hash, nil)
      result.should == hash["name"].to_xml(:root => "name")
    end
    
  end
  
end
