require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'エントリー新規登録' do
    before do
      @entry = FactoryBot.build(:entry)
    end

    context 'エントリー登録ができるとき' do
      it '必須情報が正しく入力されると登録できる' do
        expect(@entry).to be_valid
      end
    end

    context 'エントリー登録ができないとき' do
      it '紹介文が必須である' do
        @entry.text = ''
        @entry.valid?
        expect(@entry.errors.full_messages).to include("Text can't be blank")
      end
    end
  end

end
