require 'json'
#rails scrap:asos
class AsosScraper
  include ActionView::Helpers::SanitizeHelper

  def run
    puts "Getting categories link"
    item_links.each do |category_url|

      puts "Getting products ids for #{category_url}"
      product_ids = product_ids_for_category(category_url)

      product_ids.each do |id|
        if !Cloth.exists?(provider_id: id)
          create_product_from(id)
        end
      end
    end
  end

  private

  def item_links #step 1
    response = RestClient.get("http://www.asos.fr/homme/")
    doc_link = Nokogiri::HTML(response)

    doc_link.search('ul.items li a').map do |link|
      link['href']
    end
  end

  def product_ids_for_category(category_url) #step 2
    response = RestClient.get(category_url)
    doc = Nokogiri::HTML(response)

    doc.search('li.product-container').map do |product|
      product['data-productid']
    end
  end

  def product_ids
    response = RestClient.get("http://www.asos.fr/homme/polos/cat/?cid=4616&pgesize=204")
    doc = Nokogiri::HTML(response)

    doc.search('li.product-container').map do |product|
      product['data-productid']
    end
  end

  def create_product_from(id) #step 3
    puts "Creating product from http://www.asos.fr/api/product/catalogue/v2/products/#{id}?store=US&currency=EUR"
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
      material: extract_material_from(response),
      images_urls: response["media"]["images"].map { |images| images['url'] },
      gender: response["gender"],
      tags: strip_tags(response["description"]).split('   ')[0..-2],
      provider_url: "http://www.asos.fr/asos/fdskjfjdsl/prd/#{response['id']}",
      provider_id: response["id"]
    )
  rescue RestClient::NotFound => e
    puts "404 for #{id}"
  end

  def extract_sizes_from(response)
    response['variants'].map { |variant| variant['brandSize'] }
  end

  def extract_material_from(response)
    materials = response['info']['aboutMe']&.split(':')

    if materials && materials.count > 1
      materials[1].split(', ').map { |elem| elem.gsub('.', '').strip }
    else
      []
    end
  end

end
