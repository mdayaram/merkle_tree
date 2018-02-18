module MerkleTree
  class Tree
    attr_reader :root
    attr_reader :value_nodes

    def initialize(*args)
      @value_nodes = args.map { |a| Leaf.new(value: a) }
      nodes = pad_values(value_nodes)

      i = 1
      while nodes.size > 1
        nodes = nodes.each_slice(2).to_a.map do |a, b|
          parent = Node.new(left: a, right: b)
          a.parent = parent
          b.parent = parent
        end
        i += 1
      end

      @root = nodes.first
    end

    def hash
      @root.hash
    end

    private

    def pad_values(nodes)
      return nodes if is_power_2(nodes.size)

      padding = next_power_2(nodes.size) - nodes.size
      nodes + padding.times.map { Pad.new }
    end

    def next_power_2(n)
      i = 1
      i = i << 1 while i < n
      i
    end

    def is_power_2(n)
      (n & (n - 1)) == 0
    end
  end
end
