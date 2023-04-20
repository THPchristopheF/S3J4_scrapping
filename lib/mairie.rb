require 'nokogiri' 
require 'open-uri'

def get_townhall_urls
page_department = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
townhall_url=""
#scrap_department=page_department.xpath('//a [@class="lientxt"]')
scrap_department=page_department.css("a[href]")

#url_cities_array=page_townhall.xpath('//a/@href').text
scrap_department.each do |cities|
  result=""
  cities_array=cities.to_s.split('.')
  url_city_array=cities_array[1].to_s
  url_townhall="https://www.annuaire-des-mairies.com"+url_city_array+".html"
    if url_townhall.include?('com/95')
      result=get_townhall_email(url_townhall)
      puts "url_townhall: #{url_townhall}                 townhall_email: #{result}" 
    end
end 
end

# qui récupère l’e-mail d'une mairie à partir de l'URL de mairies
# url_townhall="https://www.annuaire-des-mairies.com/95/avernes.html"
def get_townhall_email(url_townhall)

page_townhall = Nokogiri::HTML(URI.open(url_townhall))
townhall_email=""
scrap_townhall=page_townhall.xpath('//tr[@class="txt-primary tr-last"]')
td_array = scrap_townhall.css("td")
td_array.each do |td_array_line| 
  if td_array_line.to_s.include?('@')
    townhall_email=(td_array_line.to_s.chomp("</td>"))[4..-1]
   # puts townhall_email
  end
end
  #  puts "townhall_email: #{townhall_email}   "
  return townhall_email
end
  

get_townhall_urls

