require 'digest'

module MerkleTree
  class Node
    attr_reader :left
    attr_reader :left_hash

    attr_reader :right
    attr_reader :right_hash

    attr_reader :hashing_scheme

    attr_accessor :parent

    def initialize(left:, right:)
      @hashing_scheme = HashingScheme.new

      @left = left
      @left_hash = left.hash

      @right = right
      @right_hash = right.hash
    end

    def hash
      hashing_scheme.hash_node(left_hash, right_hash)
    end
  end
end
