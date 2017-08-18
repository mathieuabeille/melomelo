require 'json'

class HandmmenScraper
  puts "Scraping's run"
  def run
    product_links.each do |link_url|
      create_cloth_from(link_url)
    end
  end

  def product_links
    response = RestClient.get("http://api.hm.com/v2/us/en/products/display?page=1&categories=men&concealCategories=true&pageSize=60&deviceType=DESKTOP")

    response = JSON.parse(response)

    response['displayArticles'].map do |link|
      link['webUrl']
    end
  end

  def create_cloth_from(item_url)
    article_id = item_url.split('article=').last

    if !Cloth.exists?(provider_id: article_id)
      response = RestClient.get(item_url)
      doc = Nokogiri::HTML(response)
      puts "Getting product url for #{item_url}"
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
        provider_url: item_url,
        provider_id: article_id
      )
    end
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
    doc.search('#options-variants li').map do |size|
      size.text.strip
    end
  end

  def extract_images_urls_from(doc)
    doc.search('#product-thumbs a').map do |link|
      link['href']
    end
  end

  def extract_gender_from(doc)
    'Men'
  end
end
