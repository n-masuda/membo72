require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができるとき' do
      it '必須情報が正しく入力されると登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it 'ニックネームが必須である' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性である' do
        @user.save
        user2 = FactoryBot.build(:user, email: @user.email)
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'fgfg.prpr.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須である' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、全角では登録できない' do
        @user.password = '１ａｂｃｄｅｆ'
        @user.password_confirmation = '１ａｂｃｄｅｆ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is valid only alphanumeric')
      end

      it 'パスワードは、確認用を含めて2回入力する' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須である' do
        @user.password = '1abcde'
        @user.password_confirmation = '2abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '活動予定地域は必須である' do
        @user.area = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Area can't be blank")
      end
      it '年齢は必須である' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end

      it 'パートは必須である' do
        @user.part = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Part can't be blank")
      end

      it '好きなアーティストが必須である' do
        @user.my_hero = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("My hero can't be blank")
      end
    end
  end

end
