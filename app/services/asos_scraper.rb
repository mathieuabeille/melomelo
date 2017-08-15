require 'json'

class AsosScraper
  include ActionView::Helpers::SanitizeHelper

  def run
    # 1. Get all product ids
    product_ids.each do |id|
      create_product_from(id)
    end
    # 2. For each product id, call api to get more information about this product
  end

  private

  def product_ids
    response = RestClient.get("http://www.asos.fr/homme/polos/cat/?cid=4616&setPrefSite=true&r=1&mk=na")
    doc = Nokogiri::HTML(response)

    doc.search('li.product-container').map do |product|
      product['data-productid']
    end
  end

  def create_product_from(id)
    # Make an HTTP resquest to API
    response = RestClient.get("http://www.asos.fr/api/product/catalogue/v2/products/#{id}?store=US&currency=EUR")

    response = JSON.parse(response)

    # Create an isntance of the model Product with data
    Cloth.create(
      name: response["name"],
      description: strip_tags(response["brand"]["description"]),
      sizes: extract_sizes_from(response),
      color: response["media"]["images"][0]["colour"],
      price: response["price"]["current"]["value"],
      brand: response["brand"]["name"],
      material: response['info']['aboutMe'].split(':')[1].split(', ').map { |elem| elem.gsub('.', '').strip },
      images_urls: response["media"]["images"].map { |images| images['url'] },
      gender: response["gender"],
      tags: strip_tags(response["description"]).split('   ')[0..-2],
      provider_url: "http://www.asos.fr/api/product/catalogue/v2/products/#{id}?store=US&currency=EUR",
      provider_id: response["id"]
    )
  rescue RestClient::NotFound => e
    puts "404 for #{id}"
  end

  def extract_sizes_from(response)
    response['variants'].map { |variant| variant['brandSize'] }
  end
end
