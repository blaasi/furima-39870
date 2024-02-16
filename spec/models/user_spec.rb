require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it '全ての項目に指定通りの入力があれば登録できる' do
        expect(@user).to be_valid 
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it 'emailに@を含めないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword(確認)が一致しないと登録できない' do
        @user.password = 'furima1'
        @user.password_confirmation = 'furima2'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'last_nameが空白では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'last_nameに全角文字以外が含まれていたら登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name には全角文字を使用してください")
      end
      it 'first_nameが空白では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'first_nameに全角文字以外が含まれていたら登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name には全角文字を使用してください")
      end
      it 'last_name_kanaが空白では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'last_name_kanaに全角カタカナ文字以外が含まれていたら登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana には全角カタカナ文字を使用してください")
      end
      it 'first_name_kanaが空白では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'first_name_kanaに全角カタカナ文字以外が含まれていたら登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana には全角カタカナ文字を使用してください")
      end
      it 'birthdayが空白では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end
    end
  end

end
