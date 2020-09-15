require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上でかつ、英字と数字の混合であれば登録できる' do
        @user.password = 'aom13680'
        @user.password_confirmation = 'aom13680'
        expect(@user).to be_valid
      end
      it '姓名が全角であると登録できる' do
        @user.last_name = '阿部'
        @user.first_name = '晋三'
        expect(@user).to be_valid
      end
      it '姓名の振り仮名がカタカナであると登録できる' do
        @user.last_name_kana = 'アベ'
        @user.first_name_kana = 'シンゾウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字と数字の混合でな場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end

      it '姓が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '姓が半角では登録できない' do
        @user.last_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it '名が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名が半角では登録できない' do
        @user.first_name = 'sinzoh'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end

      it '姓の振り仮名が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '姓の振り仮名が半角カナでは登録できない' do
        @user.last_name_kana = 'ｱﾍﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力して下さい。')
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
