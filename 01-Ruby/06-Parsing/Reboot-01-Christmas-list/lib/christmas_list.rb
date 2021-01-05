def list(gifts)
  gifts.each_with_index do |gift, index|
    status = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} - #{status} #{gift[:name]}, #{gift[:price]}$"
  end
end

def scraping(keyword)
  url = "https://www.etsy.com/search?q=#{keyword}"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  etsy_gift = []
  html_doc.search('.v2-listing-card__info').each do |element|
    etsy_name = element.search('.text-body').text.strip
    etsy_price = element.search('.currency-value').text.strip.to_i

    etsy_gift << { name: etsy_name, price: etsy_price }
  end
  etsy_gift
end

def load_csv
  filepath = 'gifts.csv'
  gifts = []

  CSV.foreach(filepath, { headers: :first_row }) do |row|
    # TODO: build new gift from information stored in each row
    gift = { name: row['name'], price: row['price'].to_i, bought: row['bought'] == "true" }
    gifts << gift
  end
  return gifts
end

def store_csv(gifts)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = 'gifts.csv'

  CSV.open(filepath, 'wb', csv_options) do |csv|
    # We had headers to the CSV
    csv << ['name', 'price', 'bought']
    # TODO: store each gift
    gifts.each do |gift|
      csv << [gift[:name], gift[:price], bought[:bought]]
    end
  end
end
