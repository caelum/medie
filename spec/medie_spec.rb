require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Always
  def can_handle?(response)
    true
  end
end

describe Medie do
  
  it "should return acceptable registries" do

    always = Always.new
    registry = Medie::Registry.new.use(always)
    registry.for("anything").should == always
    
  end
  
end
