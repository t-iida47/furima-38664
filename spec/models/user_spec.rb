require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "test@test.com", password: "test000", password_confirmation: "test000", last_name: "山田", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "test", email: "", password: "test000", password_confirmation: "test000", last_name: "山田", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "", password_confirmation: "test000", last_name: "山田", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password_confirmationが空だと登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "test000", password_confirmation: "", last_name: "山田", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "test000", password_confirmation: "test000", last_name: "", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空では登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "test000", password_confirmation: "test000", last_name: "山田", first_name: "", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_name_kanaが空だと登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "test000", password_confirmation: "test000", last_name: "山田", first_name: "てすと", last_name_kana: "", first_name_kana: "テスト", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "test000", password_confirmation: "test000", last_name: "山田", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "", birth_date: "2000/07/03")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "Birth_dateが空だと登録できない" do
      user = User.new(nickname: "test", email: "test@test.com", password: "test000", password_confirmation: "test000", last_name: "山田", first_name: "てすと", last_name_kana: "ヤマダ", first_name_kana: "テスト", birth_date: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

  end
end
