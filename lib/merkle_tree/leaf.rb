require 'digest'

module MerkleTree
  class Leaf
    attr_reader :value
    attr_accessor :parent

    def initialize(value:)
      @value = value
    end

    def hash
      Digest::SHA2.hexdigest("L:#{value}")
    end
  end
end
