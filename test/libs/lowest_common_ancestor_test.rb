require 'test_helper'

class LowestCommonAncestorTest < ActiveSupport::TestCase
  test 'returns the lowest common ancestor' do
    arr_1 = [130, 125, 2820230]
    arr_2 = [130, 125, 4430546, 5497637]
    lca = LowestCommonAncestor.call(arr_1, arr_2)

    assert_equal 125, lca[:lowest_common_ancestor]
    assert_equal 2, lca[:depth]
    assert_equal 130, lca[:root_id]
  end

  test 'it should return itself' do
    arr_1 = [130, 125, 4430546]

    lca = LowestCommonAncestor.call(arr_1, arr_1)
    assert_equal 4430546, lca[:lowest_common_ancestor]
    assert_equal 3, lca[:depth]
    assert_equal 130, lca[:root_id]
  end

  test 'it should return null if no match' do
    arr_1 = [130, 125, 2820230]
    arr_2 = [131, 122, 4430543, 5497632]
    lca = LowestCommonAncestor.call(arr_1, arr_2)

    assert_nil lca[:lowest_common_ancestor]
    assert_nil lca[:depth]
    assert_nil lca[:root_id]
  end
end
