
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'


   

def getemail (urldeputy)
	page = Nokogiri::HTML(open(urldeputy))
	email = page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').text

	nom = page.css('h1').text
	print nom + " : "
	puts email

end

def getallurls()
	doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	div_classes = doc.xpath('//div[@class="list_table"]')
	all_a = div_classes.css('a')   

	touteslesurl = all_a.map{|element| urls = 'https://nosdeputes.fr'+element["href"]}

	# puts touteslesurl

	touteslesurl.each { |url| puts getemail(url) }
	

end
getallurls



