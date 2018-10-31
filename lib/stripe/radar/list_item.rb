# frozen_string_literal: true

module Stripe
  module Radar
    class ListItem < Stripe::APIResource
      extend Stripe::APIOperations::Create
      include Stripe::APIOperations::Delete
      extend Stripe::APIOperations::List

      OBJECT_NAME = "radar.list_item".freeze
    end
  end
end
