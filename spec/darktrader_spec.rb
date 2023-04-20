require_relative '../lib/darktrader.rb'
describe "darktrader method" do
  it "should return an email" do
    expect(darktrader).to eq("DAI : 0.9995")

  end
end

