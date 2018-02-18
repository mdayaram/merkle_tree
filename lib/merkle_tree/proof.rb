module MerkleTree
  class Proof
    class Node
      attr_reader :left_hash
      attr_reader :right_hash

      def initialize(left_hash, right_hash)
        @left_hash = left_hash
        @right_hash = right_hash
      end
    end

    attr_reader :value
    attr_reader :proof_root

    def initialize(merkle_tree:, value:)
      @value = value
      @proof_root = build_proof(merkle_tree, value)
    end

    def verify_inclusion(root_hash)

    end

    private

    def build_proof(node, value)
    end
  end
end
