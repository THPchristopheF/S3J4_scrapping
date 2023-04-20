require_relative '../lib/mairie.rb'
describe "the get_townhall_email(url_townhall) method" do
  it "should return an email" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")

  end
end
describe "the get_townhall_email(url_townhall) method" do
  it "should return an email" do
    expect(get_townhall_email("https://www.thehackingproject.org/fr/dashboard/courses/4/weeks/3/days/4")).to eq("")

  end
end
