module MerkleTree
  class Root
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

    # Returns a list of hashes of the neighbor at each level.
    def proof_of_inclusion(value)
      node = value_nodes.find { |v| v.value == value }
      raise "Value #{value} does not exist in MerkleTree" if node.nil?

      proof = [node.value]
      while node.parent != nil
        if node.parent.left_hash != node.hash
          proof << ['L', node.parent.left_hash]
        elsif node.parent.right_hash != node.hash
          proof << ['R', node.parent.right_hash]
        end

        if node.parent.left_hash != node.hash && node.parent.right_hash != node.hash
          raise "something weird!"
        end

        node = node.parent
      end

      proof
    end

    # Note: does not use any instance methods.
    def validate_inclusion(proof, root_hash)
      proof = proof.dup
      ihash = Digest::SHA2.hexdigest("L:#{proof.shift}")

      while !proof.empty?
        neighbor = proof.shift
        if neighbor.first == "L"
          ihash = Digest::SHA2.hexdigest("N:#{neighbor.last}||#{ihash}")
        else
          ihash = Digest::SHA2.hexdigest("N:#{ihash}||#{neighbor.last}")
        end
      end

      ihash == root_hash
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
