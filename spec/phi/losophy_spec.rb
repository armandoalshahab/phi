require 'spec_helper'

describe Phi::Losophy do
  let(:term) { "hyperlink" } 
  let(:instance) { described_class.new(term) }

  it "can calculate the index of 'philosophy'" do 
    expect(described_class.new("philosophy").index).to eq 0
  end

  it "can calculate the index" do 
    # binding.pry
    expect(instance.index).to eq 19
  end

  it "injects the term correctly" do 
    expect(instance.term).to eq term 
  end

  it "looks fancy when inspected" do 
    expect(instance.inspect).to eq "#<Phi::Losophy:#{term}>"
  end

  it "has pages" do 
    expect(instance.pages).to be_a Phi::Losophy::Pages
  end

  it "has a connection" do 
    expect(instance.connection).to be_an Excon::Connection
  end
end
