require 'digest'

module MerkleTree
  class Leaf
    attr_reader :value

    def initialize(value:)
      @value = value
    end

    def hash
      Digest::SHA2.hexdigest("L:#{value}")
    end
  end
end
