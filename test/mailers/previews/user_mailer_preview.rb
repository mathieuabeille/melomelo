
class UserMailerPreview < ActionMailer::Preview
  def match
    @wish = Wish.last
    @user = @wish.user
    @cloth = Cloth.last
    UserMailer.match(@cloth, @wish)
  end
end
