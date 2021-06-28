# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#body' do

    context 'with a body present' do
      let(:tweet) { build(:tweet) }
      it do
        is_expected.to validate_presence_of :body
        is_expected.not_to allow_value(nil).for(:body)
      end
    end
  end
end
