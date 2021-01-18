# Ruby xUnit

This is a toy project illustrating the concepts onlined in Beck's [Test Driven Development: By Example](https://www.goodreads.com/book/show/387190.Test_Driven_Development). Here I follow chapter 18 (page 91) to implement 'a tool for test-driven devlopment'. The architecture of this tool is based on [xUnit](https://en.wikipedia.org/wiki/XUnit). I have implemented the tool or test framework in Ruby, however the example Beck shows in his book is written in Python.

## Usage
To run the tests against the code in lib/
```Shell
make run
```

## Development

After checking out the repo, to SSH into the docker conatainer run
```Shell
make shell
```

Next, it will be possible to run the test suite simply as
```Shell
ruby test/test_case_test.rb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronanduddy/ruby-xunit. Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Kent Beck
