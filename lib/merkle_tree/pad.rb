require 'digest'

module MerkleTree
  class Pad < Leaf
    def initialize
      super(value: "")
    end
  end
end
