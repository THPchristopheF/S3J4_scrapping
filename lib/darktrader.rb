require 'nokogiri' 
require 'open-uri'


html_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))  


# Symbol   1INCH
# xpath complet : /html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div
# Price     $0.5148
# xpatch complet :# /html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a/span


#definit le tableau des valeurs
board=html_page.xpath('//tr[@class="cmc-table-row"]')
currency_price_hash=Hash.new
board.each do |boardline|
  currency=boardline.xpath('td[3]/div').text
  price=boardline.xpath('td[5]/div/a/span').text
  price.slice!(0) #pour supprimer le $
  puts "currency #{currency}  price #{price}"
  currency_price_hash[currency]=price
end 

puts "valeur pour SOL:  #{currency_price_hash["SOL"]}"
puts
puts "affiche le hash:"

currency_price_hash.each do |currency,price|
  puts currency + " : "+ price 
end


