require 'json'

class HandmScraper

  def run
    puts "Getting links products"
    product_links.each do |link_url|
      create_cloth_from(link_url)
    end
  end

  def product_links
    response = RestClient.get("http://api.hm.com/v2/us/en/products/display?page=4&categories=men&concealCategories=true&pageSize=60&deviceType=DESKTOP")

    response = JSON.parse(response)

    response['displayArticles'].map do |link|
      link['webUrl']
    end
  end

  def create_cloth_from(item_url)
    #option 1
    response = RestClient.get(item_url)
    doc = Nokogiri::HTML(response)

    Cloth.create(
      name: extract_name_from(doc),
      description: extract_description_from(doc),
      color: extract_color_from(doc),
      price: extract_price_from(doc),
      tags: extract_tags_from(doc),
      brand: extract_brand_from(doc),
      material: extract_material_from(doc),
      sizes: extract_sizes_from(doc),
      images_urls: extract_images_urls_from(doc),
      gender: extract_gender_from(doc),
      provider_url: extract_provider_url_from(doc),
      provider_id: extract_provider_id_from(doc)
    )
  end

  private

  def extract_name_from(doc)
    doc.search('#content form h1').text.strip
  end

  def extract_description_from(doc)
    doc.search('#content .description p')[0].text.strip
  end

  def extract_color_from(doc)
    doc.search('#text-selected-article').text.strip
  end

  def extract_price_from(doc)
    doc.search('#text-price').text.strip.split('$').last
  end

  def extract_tags_from(doc)
    doc.search('#content .description p')[0].text.strip.split(' ')
  end

  def extract_brand_from(doc)
    "H&M"
  end

  def extract_material_from(doc)
    doc.search('#text-information').text.split(',')
  end

  def extract_sizes_from(doc)
    doc.search('#input-size value').text.strip
  end

  def extract_images_urls_from(doc)
    doc.search('#content .product-thumbs a').map do |link|
      link['href']
    end
  end

  def extract_gender_from(doc)
    'Men'
  end

  def extract_provider_url_from(doc)
    doc
  end

  def extract_provider_id_from(doc)
    doc.search('#input-article value')
  end
end
