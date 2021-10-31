require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @pay_form = FactoryBot.build(:pay_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報登録' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pay_form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @pay_form.building_name = ''
        expect(@pay_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'Tokenが空だと保存できないこと' do
        @pay_form.token = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @pay_form.post_code = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @pay_form.post_code = '1234567'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Post code  Input correctly')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @pay_form.prefecture_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Prefecture serect')
      end
      it 'Cityが空だと保存できないこと' do
        @pay_form.city = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @pay_form.phone_number = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone number  Input only number')
      end
      it '電話番号に半角数字以外が含まれている場合は登録できない' do
        @pay_form.phone_number = '090１2111122'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone number  Input only number')
      end

      it '電話番号が9桁以下では登録できない' do
        @pay_form.phone_number = '090123456'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone number  Input only number')
      end

      it '電話番号が12桁以上では登録できない' do
        @pay_form.phone_number = '090123456789'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone number  Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @pay_form.user_id = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @pay_form.item_id = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
