require 'rubygems'
  require 'nokogiri'
    require 'open-uri'
        require 'pry'
            require 'watir-scroll'

def scrapping
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))

  crypto_ticker_symbol = page.xpath('//td[contains(@class,"symbol")]')

  crypto_price = page.xpath('//td[contains(@class,"price")]')

  crypto_ticker_symbol_array = crypto_ticker_symbol.collect(&:text)

  crypto_price_array = crypto_price.collect(&:text)

  data = Hash[crypto_ticker_symbol_array.zip crypto_price_array]
  
  final_data = data.map {|key, value| puts "#{key} => #{value.delete("$,").to_f}"}
    return final_data
end 

def perform 
  scrapping
end

perform 






# helene = page.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')



#prix=prix.map(&:to_f)