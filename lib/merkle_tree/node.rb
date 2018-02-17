require 'digest'

module MerkleTree
  class Node
    attr_reader :left
    attr_reader :left_hash

    attr_reader :right
    attr_reader :right_hash

    def initialize(left:, right:)
      @left = left
      @left_hash = left.hash

      @right = right
      @right_hash = right.hash
    end

    def hash
      Digest::SHA2.hexdigest("#{left_hash}||#{right_hash}")
    end
  end
end
