require 'digest'

module MerkleTree
  class HashingScheme

    attr_reader :digester
    attr_reader :leaf_prefix
    attr_reader :node_prefix

    def initialize(digester: Digest::SHA2, leaf_prefix: "L:", node_prefix: "N:")
      @digester = digester
      @leaf_prefix = leaf_prefix
      @node_prefix = node_prefix
    end

    def hash_leaf(value)
      digester.hexdigest(leaf_prefix + value)
    end

    def hash_node(left_hash, right_hash)
      digester.hexdigest(node_prefix + left_hash + "||" + right_hash)
    end
  end
end
