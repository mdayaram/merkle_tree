module MerkleTree
  class Root
    attr_reader :root

    def initialize(*args)
      nodes = args.map { |a| Leaf.new(value: a) }
      nodes = pad_values(nodes)

      i = 1
      while nodes.size > 1
        nodes = nodes.each_slice(2).to_a.map do |a, b|
          Node.new(left: a, right: b)
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
