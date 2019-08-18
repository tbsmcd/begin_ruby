require 'minitest/autorun'
require_relative '../lib/convert_hash_syntax'

class ConvertHashSyntaxTest < Minitest::Test
  def test_convert_hash_syntax
    old_syntax = <<~EOL
      {
        :name => 'Alice',
        :age=> 20,
        :gender  =>   :female
      }
    EOL
    expected = <<~EOL
      {
        name: 'Alice',
        age: 20,
        gender: :female
      }
    EOL
    assert_equal expected, convert_hash_syntax(old_syntax)
  end
end