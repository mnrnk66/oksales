require "spec_helper"

describe Client do
  it { should ensure_length_of(:name).is_at_most(255) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:abbr).is_at_most(255) }
  it { should ensure_length_of(:code).is_at_most(255) }
  it { should validate_uniqueness_of(:code).allow_nil }
  it { should ensure_length_of(:full_name).is_at_most(255) }
  it { should ensure_length_of(:full_name_kana).is_at_most(255) }
  it { should allow_value('カタカナ', 'ｶﾀｶﾅ').for(:full_name_kana) }
  it { should_not allow_value('ひらがな', '漢字', '12345')
       .for(:full_name_kana)
       .with_message(I18n.t('activerecord.errors.messages.invalid_katakana_format')) }
  it { should allow_value('1234567').for(:zipcode) }
  it { should_not allow_value('123456', '12345678', 'abcdef', 'あいうえお')
       .for(:zipcode)
       .with_message(I18n.t('activerecord.errors.messages.invalid_zipcode_format')) }
  it { should ensure_length_of(:pref_name).is_at_most(255) }
  it { should ensure_length_of(:address_city).is_at_most(255) }
  it { should ensure_length_of(:address_extra).is_at_most(255) }
  it { should ensure_length_of(:sales_person_name).is_at_most(255) }
  it { should ensure_length_of(:sales_person_email).is_at_most(255) }
  it { should allow_value('test@sample.com').for(:sales_person_email) }
  it { should_not allow_value('test', '1234', 'メール')
       .for(:sales_person_email)
       .with_message(I18n.t('activerecord.errors.messages.invalid_email_format')) }

  describe '#valid?' do
    subject { FactoryGirl.build(:client, full_name_kana: full_name_kana) }
    before { subject.valid? }

    context 'full_name_kana に半角カタカナが渡されたとき' do
      let(:full_name_kana) { 'ｶﾀｶﾅ' }

      it '全角カナに変換される' do
        expect(subject.full_name_kana).to eq('カタカナ')
      end
    end
  end

  describe '.matches' do
    subject { Client.matches(client_search_form) }
    let(:client_search_form) { ClientSearchForm.new(params) }

    let!(:client_1) { FactoryGirl.create(:client,
                                         name: 'Spec株式会社',
                                         full_name_kana: 'スペックカブシキガイシャ',
                                         code: 'ABCD') }
    let!(:client_2) { FactoryGirl.create(:client,
                                         name: '有限会社スペック',
                                         full_name_kana: 'ユウゲンガイシャスペック',
                                         code: 'DEFG') }
    let!(:client_3) { FactoryGirl.create(:client,
                                         name: 'テスト株式会社',
                                         full_name_kana: 'テストカブシキガイシャ',
                                         code: 'XYZ') }

    context '存在する name を指定したとき' do
      let(:params) { {name: '株式会社'} }

      it { should include(client_1, client_3) }
      it { should_not include(client_2) }
    end

    context '存在しない name を指定したとき' do
      let(:params) { {name: '存在しない'} }

      it { should be_empty }
    end

    context '存在する full_name_kana を指定したとき' do
      let(:params) { {full_name_kana: 'ユウゲンガイシャ'} }

      it { should include(client_2) }
      it { should_not include(client_1, client_3) }
    end

    context '存在しない full_name_kana を指定したとき' do
      let(:params) { {full_name_kana: 'ソンザイシナイ'} }

      it { should be_empty }
    end

    context '存在する code を指定したとき' do
      let(:params) { {code: 'X'} }

      it { should include(client_3) }
      it { should_not include(client_1, client_2) }
    end

    context '存在しない code を指定したとき' do
      let(:params) { {code: 'K'} }

      it { should be_empty }
    end

    context '存在する name と full_name_kana を指定したとき' do
      let(:params) { {name: '会社', full_name_kana: 'スペック'} }

      it { should include(client_1, client_2) }
      it { should_not include(client_3) }
    end

    context '存在する name と full_name_kana と code を指定したとき' do
      let(:params) { {name: '会社', full_name_kana: 'スペック', code: 'G'} }

      it { should include(client_2) }
      it { should_not include(client_1, client_3) }
    end

  end
end
