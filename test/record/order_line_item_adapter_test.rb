require 'test_helper'

class Gecko::Record::OrderLineItemAdapterTest < Minitest::Test
  include TestingAdapter
  include SharedAdapterExamples

  let(:adapter)           { @client.OrderLineItem }
  let(:vcr_cassette_name) { "order_line_items" }
  let(:record_class)      { Gecko::Record::OrderLineItem }

  def test_initializes_adapter
    assert_instance_of(Gecko::Record::OrderLineItemAdapter, @client.OrderLineItem)
  end

  def test_undef_count
    assert !adapter.respond_to?(:count)
  end
end
