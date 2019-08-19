require 'minitest/autorun'
require_relative '../lib/deep_freezable'
require_relative '../lib/bank'
require_relative '../lib/team'

class DeepFreezeTest < Minitest::Test
  def test_deep_freeze_to_array
    # 配列の値は正しいか
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES
    # 配列自体は凍結されているか
    assert Team::COUNTRIES.frozen?
    # 配列の要素は凍結されているか
    assert Team::COUNTRIES.all? { |country| country.frozen? }
  end

  def test_deep_freeze_hash
    assert_equal(
        {'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee'},
        Bank::CURRENCIES
    )

    assert Bank::CURRENCIES.frozen?

    assert Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? }
  end
end