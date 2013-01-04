require 'spec_helper'

class Avocado
  def self.build
    Avocado.new
  end
  def talk
    raise "a talking avocado is preposterous "
  end
end


describe  "rspec-radar" do
  subject { Avocado.new }

  describe "#stub"do
    context "instance" do 
      it "stubs the method like normal" do
        subject.stub(:talk).and_return("fruit")
        subject.talk.should == "fruit"
      end
      it "raises an error if the method doesn't exist" do
        expect { 
          subject.stub(:run)
        }.to raise_error RSpec::Radar::UndefinedMethodError
      end
    end

    context "class" do
      it "stubs the method like normal" do
        Avocado.stub(:build).and_return("built")
        Avocado.build.should == "built"
      end
      it "raises an error if the method doesn't exist" do
        expect { 
          Avocado.stub(:pick)
        }.to raise_error RSpec::Radar::UndefinedMethodError
      end
    end
  end

  describe "should_receive" do
    it 'stubs the method like normal' do
      subject.should_receive(:talk).and_return("green")
      subject.talk.should == "green"
    end
    it 'will raise an exception if called too many times' do
      expect {
      subject.should_receive(:talk).exactly(2).times
      3.times { subject.talk }
      }.to raise_error RSpec::Mocks::MockExpectationError
    end
    it "raises an error if the object doesn't have the method stubbed" do
      expect {
        subject.should_receive(:run)
      }.to raise_error RSpec::Radar::UndefinedMethodError
    end
  end

  describe "as_null_object" do
    it "still works as normal" do
      subject = stub(Avocado).as_null_object
      subject.fake_method.should_not be_nil
    end
  end

end
