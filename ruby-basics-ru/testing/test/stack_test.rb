# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_add_to_empty
    stack = Stack.new
    expected = ['ruby']
    assert { stack.push!('ruby').to_a == expected }
  end

  def test_add_to_not_empty
    stack = Stack.new(['ruby'])
    expected = %w['ruby js']
    assert { stack.push!('js').to_a == expected }
  end

  def test_deletion
    stack = Stack.new %w[ruby js]
    expected = ['ruby']
    stack.pop!
    assert { stack.to_a == expected }
  end

  def test_lifo_deletion
    stack = Stack.new %w[ruby js]
    expected = Stack.new %w[ruby js]
    stack.push! 'php'
    stack.pop!
    assert_equal stack.to_a, expected.to_a
  end

  def test_empty
    stack = Stack.new ['php']
    stack.clear!
    assert { stack.to_a == [] }
  end

  def test_emptynes_with_fullfield
    stack = Stack.new ['ruby']
    refute { stack.empty? }
  end

  def test_emptyness_with_empty
    stack = Stack.new
    assert { stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
