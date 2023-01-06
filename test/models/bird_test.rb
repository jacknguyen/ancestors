require "test_helper"

class BirdTest < ActiveSupport::TestCase
  test "given root node ids" do
    ancestors = common_ancestors(:root_node_1, :root_node_2).pluck(:id)
    birdies = Bird.find_by_ancestors(ancestors.join(','))

    assert_equal Bird.count, birdies.size
  end

  test "given all ancestors ids" do
    ancestors = common_ancestors.pluck(:id)
    birdies = Bird.find_by_ancestors(ancestors.join(','))

    assert_equal Bird.count, birdies.size
  end

  test "given last child node" do
    ancestors = common_ancestors(:root_node_2, :node_7).pluck(:id)
    birdies = Bird.find_by_ancestors(ancestors.join(','))

    assert_equal 6, birdies.size
  end
end
