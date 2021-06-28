# frozen_string_literal: true

require "rails_helper"

RSpec.describe TweetsController do
  let(:tweet) { create(:tweet) }

  describe '#index' do
    before do
      get :index
    end

    it do
      is_expected.to respond_with :ok
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end
  end

  describe '#show' do
    before do
      get :show, :params => { :id => tweet.id }
    end

    it do
      is_expected.to respond_with :ok
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it do
      is_expected.to respond_with :ok
    end
  end

  describe '#edit' do
    before do
      get :edit, :params => { :id => tweet.id }
    end

    it do
      is_expected.to respond_with :ok
    end
  end

  describe '#create' do
    before do
      get :create, :params => { :tweet => { :body => 'body' } }
    end

    it do
      is_expected.to respond_with :redirect
    end
  end

  describe '#destroy' do
    before do
      get :destroy, :params => { :id => tweet.id }
    end

    it do
      is_expected.to respond_with :redirect
    end
  end
end