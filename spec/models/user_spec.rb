require 'rails_helper'

RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
end

  describe 'ユーザー新規登録' do
    it "family_nameがない場合は登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end

    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "family_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Family name kana can't be blank"
    end

    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"First name kana can't be blank"
    end

    it "nicknameがない場合は登録できないこと" do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "emailがない場合は登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "birthdayがない場合は登録できないこと" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end

      it "passwordがない場合は登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it "first_nameは、全角での入力が必須であること" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name Input full-width characters."
    end

    it "family_nameは、全角での入力が必須であること" do
      @user.family_name = "hurima"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name Input full-width characters."
    end

    it "first_name_kanaは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana ="太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana Input full-width katakana characters."
    end

    it "family_name_kanaは、全角（カタカナ）での入力が必須であること" do
      @user.family_name_kana = "小太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana Input full-width katakana characters."
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it "family_name_kanaは半角文字だと登録できないこと" do
      @user.family_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana Input full-width katakana characters."
    end

    it "first_name_kanaは半角文字だと登録できないこと" do
      @user.first_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana Input full-width katakana characters."
    end

    it "emailには「@」を含む必要があること" do
      @user.email = "sample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
  end

  it "passwordは半角英語のみでは登録できない" do
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password Input Password Include both letters and numbers."
  end

  it "passwordは半角数字のみでは登録できない" do
    @user.password = "000000"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password Input Password Include both letters and numbers."
  end

  it "passwordは全角では登録できないこと" do
    @user.password = "hhh０００"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password Input Password Include both letters and numbers."
  end
  end
  end