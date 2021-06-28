# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#body' do
    let(:tweet) { build(:tweet) }

    it do
      is_expected.to validate_presence_of :body
      is_expected.to allow_value('tweet body').for(:body)
      is_expected.not_to allow_value(nil).for(:body)
    end
  end

  describe 'default_scope' do
    subject(:scope) { described_class.all }

    let(:tweet1) { create(:tweet, created_at: 2.day.ago) }
    let(:tweet2) { create(:tweet, created_at: 1.day.ago) }
    let(:tweet3) { create(:tweet, :with_deleted) }

      it do
        expect(scope).to include tweet1
        expect(scope).to include tweet2
        expect(scope).not_to include tweet3
        expect(scope.first).to eq(tweet2)
      end
  end

  describe '.visible' do
    subject(:scope) { described_class.visible }

    let(:tweet) { create(:tweet) }

    context 'when visible = true' do
      it { expect(scope).to include tweet }
    end

    context 'when visible = false' do
      before { tweet.update! deleted_at: 1.day.ago }

      it { expect(scope).not_to include tweet }
    end
  end

  describe '.with_deleted' do
    subject(:scope) { described_class.with_deleted }

    let(:tweet1) { create(:tweet) }
    let(:tweet2) { create(:tweet, :with_deleted) }

    context 'when with_deleted = true' do
      it do
        expect(scope).to include tweet1
        expect(scope).to include tweet2
      end
    end
  end

  describe '.deleted' do
    subject(:scope) { described_class.deleted }

    let(:tweet1) { create(:tweet) }
    let(:tweet2) { create(:tweet, :with_deleted) }

    context 'when deleted = true' do
      it do
        expect(scope).to include tweet2
        expect(scope).not_to include tweet1
      end
    end
  end
end
