require "merkle_tree/version"
require "merkle_tree/leaf"
require "merkle_tree/node"

module MerkleTree
  def self.create!(*args)
    raise "Sizes of non-powers of 2 not supported!" if args.size.to_s(2).count("1") != 1

    nodes = args.map { |a| Leaf.new(value: a) }
    while nodes.size > 1
      nodes = nodes.each_slice(2).to_a.map do |a, b|
        Node.new(left: a, right: b)
      end
    end

    nodes.first
  end
end
