require 'rails_helper'

RSpec.describe User, type: :model do
  
  # 姓、名、メール、パスワードがあれば有効な状態であること
  describe User do
    # 有効なファクトリを持つこと
    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    # 他のスペックが並ぶ。。。

    # 名がなければ無効な状態であること
    it "is invalid without a first name" do
      user = FactoryBot.build(:user, first_name: nil) 
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
 
    # 性がなければ無効な状態であること
    it "is invalid without a last name" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 性がなければ無効な状態であること
    it "is invalid without a last name" do
      user = FactoryBot.build(:user, last_name: nil) 
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # ユーザーのフルネームを文字列として返すこと
    it "returns a user's full name as a string" do
      user = FactoryBot.build(:user, first_name: "John", last_name: "Doe")
      expect(user.name).to eq "John Doe"
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
