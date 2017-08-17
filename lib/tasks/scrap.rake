namespace :scrap do
  desc "Scrap asos products"
  task asos: :environment do
    AsosScraper.new.run
  end
end

namespace :scrap do
  desc "Scrap H&M products"
  task handm: :environment do
    HandmScraper.new.run
  end
end
