require 'rails_helper'

RSpec.describe BrandsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Brand. As you add validations to Brand, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) do
    FactoryBot.build(:brand).attributes.symbolize_keys
  end

  let(:invalid_attributes) do
    FactoryBot.build(:brand, name: '').attributes.symbolize_keys
  end

  context 'authentication' do
    login_user :admin

    it 'should have a current_user' do
      expect(subject.current_user).to_not be_nil
    end

    it 'should get index' do
      get 'index'
      expect(response).to be_successful
    end
  end

  describe 'GET index' do
    login_user :admin

    it 'assigns all brands as @brands' do
      2.times { Brand.create! valid_attributes }
      get :index
      expect(assigns(:brands).count).to eq(Brand.count)
    end
  end

  describe '#show' do
    login_user :admin

    context 'as an authorized user' do
      before do
        @brand = FactoryBot.create(:brand)
      end
      it 'responds successfully' do
        get :show, params: { id: @brand.id }
        expect(response).to be_successful
      end
    end

    context 'as an unauthorized user' do
      before do
        @brand = FactoryBot.create(:brand)
      end
      it 'redirects to the dashboard' do
        sign_out :user
        get :show, params: { id: @brand.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
