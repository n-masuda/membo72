require 'rails_helper'

RSpec.describe Want, type: :model do
  describe '募集情報新規登録' do
    before do
      @want = FactoryBot.build(:want)
    end

    context '募集情報登録ができるとき' do
      it '必須情報が正しく入力されると登録できる' do
        expect(@want).to be_valid
      end
    end

    context '募集情報登録ができないとき' do
      it 'タイトルが必須である' do
        @want.title = ''
        @want.valid?
        expect(@want.errors.full_messages).to include("Title can't be blank")
      end

      it '紹介文が必須である' do
        @want.text = ''
        @want.valid?
        expect(@want.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
