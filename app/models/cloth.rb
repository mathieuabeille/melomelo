class Cloth < ApplicationRecord
  self.table_name = 'clothes'

  after_create :check_match_wishes

  private

  def check_match_wishes
    # 1. Check for every wish, if the wish match the cloth
    Wish.all.each do |wish|
      send_match_email(wish) if MatchTest.new(self, wish).match?
    end
  end


  def send_match_email(wish)
    UserMailer.match(self, wish).deliver_now
  end
end


