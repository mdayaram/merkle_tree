require 'digest'

module MerkleTree
  class Pad
    def initialize
    end

    def hash
      Digest::SHA2.hexdigest("")
    end
  end
end
