require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Always
  def can_handle?(response)
    true
  end
end
class Never
  def can_handle?(response)
    false
  end
end

describe Medie do
  
  it "should return acceptable registries" do

    handler = Always.new
    registry = Medie::Registry.new.use(handler)
    registry.for("anything").should == handler
    
  end

  it "should return nil if there is no handler available" do

    registry = Medie::Registry.new.use(Never.new)
    registry.for("anything").should be_nil

  end

  
  it "should always use the most recent registered handler" do

    handler = Always.new
    registry = Medie::Registry.new
    registry.use(Always.new)
    registry.use(handler)
    registry.for("anything").should == handler
    
  end
  
  
end
