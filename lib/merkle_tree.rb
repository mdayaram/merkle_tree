require "merkle_tree/version"
require "merkle_tree/hashing_scheme"
require "merkle_tree/leaf"
require "merkle_tree/node"
require "merkle_tree/pad"
require "merkle_tree/tree"
require "merkle_tree/proof"

module MerkleTree
  def self.create!(*args)
    MerkleTree::Tree.new(*args)
  end
end
