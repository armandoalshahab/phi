require 'spec_helper'

describe Phi::Losophy::Pages do
  it "includes Enumerable" do 
    expect(described_class.ancestors).to include Enumerable
  end
end
