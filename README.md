# MerkleTree

Generate a Merkle tree given the following body of data, using SHA-2 as your hashing algorithm

Your data is the following blocks:

```
 "We", "hold", "these", "truths", "to", "be", "self-evident", "that"
```

* In the internal stages, concatenate blocks as so: `"#{blockA.hash}||#{blockB.hash}"`
* Do not use any special padding for leaf vs internal nodes
* The merkle root should be equal to `c4f66b2f97c9fb2fcb58b08b4f260d396b5c972ff4948c7deccc81fa34db1a44`

**Bonuses**

* Bonus 1: create a padding scheme so that arbitrary numbers of blocks can be Merkleized.
* Bonus 2: add different padding to the leaves as opposed to internal nodes, so that preimage attacks are impossible.
* Bonus 3: implement an interface for Merkle proofs. Have a `prove_inclusion(block)` function and a `verify_inclusion(proof, merkle_root)` function.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'merkle_tree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install merkle_tree

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mdayaram/merkle_tree.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
