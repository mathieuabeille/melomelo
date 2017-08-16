namespace :scrap do
  desc "Scrap asos products"
  task asos: :environment do
    AsosScraper.new.run
  end
end
