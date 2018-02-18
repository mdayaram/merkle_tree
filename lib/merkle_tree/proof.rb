module MerkleTree
  class Proof
    attr_reader :value
    attr_reader :neighbors

    attr_reader :hashing_scheme

    def initialize(merkle_tree:, value:)
      @hashing_scheme = HashingScheme.new

      @value = value
      @neighbors = build_neighbors_list(merkle_tree, value)
    end

    def verify_inclusion(root_hash)
      ihash = hashing_scheme.hash_leaf(value)

      final_hash = neighbors.reduce(ihash) do |current_hash, (neighbor_pos, neighbor_hash)|
        if neighbor_pos == :L
          hashing_scheme.hash_node(neighbor_hash, current_hash)
        elsif neighbor_pos == :R
          hashing_scheme.hash_node(current_hash, neighbor_hash)
        else
          raise "Malformed proof! Expected :R/:L positions, was #{neighbor_pos}"
        end
      end

      final_hash == root_hash
    end

    private

    def build_neighbors_list(tree, value)
      proof = []
      node = tree.value_nodes.find { |v| v.value == value }
      while node.parent != nil
        if node.parent.left_hash != node.hash
          proof << [:L, node.parent.left_hash]
        elsif node.parent.right_hash != node.hash
          proof << [:R, node.parent.right_hash]
        else
          raise "This is extremely unexpected."
        end

        node = node.parent
      end

      proof
    end
  end
end
