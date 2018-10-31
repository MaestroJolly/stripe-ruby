# frozen_string_literal: true

module Stripe
  module Radar
    class List < Stripe::APIResource
      extend Stripe::APIOperations::Create
      include Stripe::APIOperations::Delete
      extend Stripe::APIOperations::List
      include Stripe::APIOperations::Save

      OBJECT_NAME = "radar.list".freeze
    end
  end
end
