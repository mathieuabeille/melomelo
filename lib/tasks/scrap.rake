namespace :scrap do
  desc "Scrap asos products"
  task asos: :environment do
    AsosScraper.new.run
  end

  desc "Scrap H&M products"
  task handmmen: :environment do
    HandmmenScraper.new.run
  end

  desc "Scrap H&M products"
  task handmwomen: :environment do
    HandmwomenScraper.new.run
  end
end
