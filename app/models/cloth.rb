class Cloth < ApplicationRecord
  self.table_name = 'clothes'

  # after_create :check_match_wishes

  private

  def match_check_color
    # 1. Check for every wish, if the wish match the cloth
    Wish.all.each do |wish|
      send_match_email(wish) if MatchTest.new(self, wish).match?
    # 2. if yes, send an email
    end
  end

  def send_match_email(wish)
    UserMailer.match(self, wish).deliver_now
  end

end


