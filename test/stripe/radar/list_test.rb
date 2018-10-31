# frozen_string_literal: true

require ::File.expand_path("../../../test_helper", __FILE__)

module Stripe
  module Radar
    class ListTest < Test::Unit::TestCase
      should "be listable" do
        lists = Stripe::Radar::List.list
        assert_requested :get, "#{Stripe.api_base}/v1/radar/lists"
        assert lists.data.is_a?(Array)
        assert lists.first.is_a?(Stripe::Radar::List)
      end

      should "be retrievable" do
        list = Stripe::Radar::List.retrieve("rsl_123")
        assert_requested :get, "#{Stripe.api_base}/v1/radar/lists/rsl_123"
        assert list.is_a?(Stripe::Radar::List)
      end

      should "be creatable" do
        list = Stripe::Radar::List.create(
          alias: "list_alias",
          name: "list_name"
        )
        assert_requested :post, "#{Stripe.api_base}/v1/radar/lists"
        assert list.is_a?(Stripe::Radar::List)
      end

      should "be saveable" do
        list = Stripe::Radar::List.retrieve("rsl_123")
        list.metadata["key"] = "value"
        list.save
        assert_requested :post, "#{Stripe.api_base}/v1/radar/lists/rsl_123"
      end

      should "be updateable" do
        list = Stripe::Radar::List.update("rsl_123", metadata: { key: "value" })
        assert_requested :post, "#{Stripe.api_base}/v1/radar/lists/rsl_123"
        assert list.is_a?(Stripe::Radar::List)
      end

      should "be deletable" do
        list = Stripe::Radar::List.retrieve("rsl_123")
        list = list.delete
        assert_requested :delete, "#{Stripe.api_base}/v1//v1/radar/lists/rsl_123"
        assert list.is_a?(Stripe::Radar::List)
      end
    end
  end
end
