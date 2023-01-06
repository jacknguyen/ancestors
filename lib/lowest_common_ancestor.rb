class LowestCommonAncestor
  attr_reader :arr_1, :arr_2

  def initialize(arr_1, arr_2)
    @arr_1 = arr_1
    @arr_2 = arr_2
  end

  def self.call(arr_1, arr_2)
    new(arr_1, arr_2).call
  end

  def call
    output = {
      root_id: nil,
      lowest_common_ancestor: nil,
      depth: nil
    }

    arr_1.each_with_index do |num, ind|
      if num == arr_2[ind]
        if ind.zero?
          output[:root_id] = num
          output[:depth] = 1
        else
          output[:depth] += 1
        end

        output[:lowest_common_ancestor] = num
      else
        break
      end
    end

    output
  end
end
