require "merkle_tree/version"
require "merkle_tree/pad"
require "merkle_tree/leaf"
require "merkle_tree/node"

module MerkleTree
  def self.create!(*args)
    nodes = args.map { |a| Leaf.new(value: a) }
    nodes = pad_values(nodes)

    build_tree(nodes)
  end

  def self.build_tree(nodes)
    # Should never happen, just a failsafe.
    raise "#{nodes.size} is not a power of 2!" if !is_power_of_2(nodes.size)

    while nodes.size > 1
      nodes = nodes.each_slice(2).to_a.map do |a, b|
        Node.new(left: a, right: b)
      end
    end

    nodes.first
  end

  def self.pad_values(nodes)
    return nodes if is_power_of_2(nodes.size)

    next_power = next_power_of_2(nodes.size)
    nodes + (next_power - nodes.size).times.map { Pad.new }
  end

  def self.next_power_of_2(n)
    i = 1
    i =  i << 1 while i < n
    i
  end

  def self.is_power_of_2(n)
    (n & (n - 1)) == 0
  end
end
