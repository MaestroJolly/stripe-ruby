# frozen_string_literal: true

require ::File.expand_path("../../../test_helper", __FILE__)

module Stripe
  module Radar
    class ListItemTest < Test::Unit::TestCase
      should "be listable" do
        items = Stripe::Radar::ListItem.list(list: "rsl_123")
        assert_requested :get, "#{Stripe.api_base}/v1/radar/list_items?list=rsl_123"
        assert items.data.is_a?(Array)
        assert items.first.is_a?(Stripe::Radar::ListItem)
      end

      should "be retrievable" do
        item = Stripe::Radar::ListItem.retrieve("rsli_123")
        assert_requested :get, "#{Stripe.api_base}/v1/radar/list_items/rsli_123"
        assert item.is_a?(Stripe::Radar::ListItem)
      end

      should "be creatable" do
        item = Stripe::Radar::ListItem.create(
          list: "rsl_123",
          value: "value"
        )
        assert_requested :post, "#{Stripe.api_base}/v1/radar/list_items"
        assert item.is_a?(Stripe::Radar::ListItem)
      end

      should "be deletable" do
        list = Stripe::Radar::ListItem.retrieve("rsli_123")
        list = list.delete
        assert_requested :delete, "#{Stripe.api_base}/v1//v1/radar/list_items/rsli_123"
        assert list.is_a?(Stripe::Radar::ListItem)
      end
    end
  end
end
