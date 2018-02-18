require 'digest'

module MerkleTree
  class Leaf
    attr_reader :value
    attr_reader :hashing_scheme

    attr_accessor :parent

    def initialize(value:)
      @hashing_scheme = HashingScheme.new
      @value = value
    end

    def hash
      hashing_scheme.hash_leaf(value)
    end
  end
end
