require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe Medie::OpenSearch::Descriptor do
  
  context "unmarshalling one url documents" do
  
    before do
      xml = '<?xml version="1.0" encoding="UTF-8"?>
      <OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/">
        <ShortName>Restbuy</ShortName>
        <Description>Restbuy search engine.</Description>
        <Tags>restbuy</Tags>
        <Contact>admin@restbuy.com</Contact>
        <Url type="application/atom+xml"  template="http://localhost:3000/products?q={searchTerms}&amp;pw={startPage?}&amp;format=atom" />
        <Url type="application/json"  template="http://localhost:3000/products?q={searchTerms}&amp;pw={startPage?}&amp;format=json" />
      </OpenSearchDescription>'
      @descriptor = Medie::OpenSearch::Driver.new.unmarshal(xml)
    end
  
    it "should unmarshall opensearch xml descriptions" do
      @descriptor.urls.size.should == 2
    end
  
  end

end