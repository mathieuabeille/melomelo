class TopshopScraper
  def run
    items_links.each do |link_url|
      puts "create a product from #{link_url}"

      products = create_product_from(link_url)
    end
  end

  private

  def items_links
    response = RestClient.get("http://us.topshop.com/en/tsus/category/clothing-70483")
    doc_link = Nokogiri::HTML(response)
    doc_link.search('.product_action').map do |element|
      element['href']
    end
  end

  def create_product_from(url) #step 3
    id = url.split("/").last.split("?").first

    if !Cloth.exists?(provider_id: id)
      puts "Creating product"
      # Make an HTTP resquest to API
      response = RestClient.get(url)
      doc = Nokogiri::HTML(response)

      # Create an isntance of the model Product with data
      Cloth.create(
        name: doc.search(".product_details > h1").text.strip,
        description: doc.search("#productInfo > p").text.strip,
        sizes: [],
        color: doc.search(".product_colour").text.split(":").last.squish,
        price: doc.search(".product_prices").text.strip,
        brand: "Topshop",
        material: [],
        images_urls: doc.search(".hero_image_link").map { |link| link['href'] },
        gender: "gender",
        tags: 'women',
        provider_url: url,
        provider_id: id
      )
    end
  # rescue RestClient::NotFound => e
  #   puts "404 for #{id}"
  end



end
