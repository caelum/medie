require 'spec_helper'

describe Medie::Json do
  
  before :all do
    full_json = IO.read(File.dirname(__FILE__) + '/full_json.js')
    @json = Medie::Json::Driver.new.unmarshal(full_json)
  end
  
  describe "JSON read" do
    
    it "should be able to read a JSON object in many ways" do
      
      @json["articles"]["link"].first["type"].should == "text/json"
      @json.articles.link.first.type.should == "text/json"

      @json.articles.links.search.href.should == "http://search.place.com"
      @json.articles.links.unknow_rel.should == nil
    end
    
  end

  describe "JSON link handling" do

    it "should be able to treat links as methods" do

      @json.articles.links.search.href.should == "http://search.place.com"
      @json.articles.links.unknown_rel.should == nil
      @json.articles.link.first.type.should == "text/json"

    end

    it "should treat links like a map" do
      @json.articles.links.should respond_to(:[])
      @json.articles.links["search"].rel.should == "search"
      @json.articles.links["unknown_rel"].should == nil
      @json.articles.links.size.should == 2
      @json.articles.links.keys.should include("search","self")
    end
    
  end
  
  describe "JSON write" do

    it "should be able to write a JSON object in many ways" do
      @json["articles"]["size"] = 10
      @json["articles"]["size"].should  == 10
  
      @json.articles.link << {"href" => "http://dont.panic.com", "rel" => "towel"}
      @json.articles.link.last.href.should == "http://dont.panic.com"
      @json.articles.link.last.rel.should  == "towel"
      @json.articles.link.size.should == 3
      
      @json.articles.link.last.type = "application/json"
      @json.articles.link.last.type.should  == "application/json"
    end
    
  end
  
end