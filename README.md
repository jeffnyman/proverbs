# Proverbs

> _Let not mercy and truth forsake thee: bind them about thy neck;
> write them upon the table of thine heart._
>
> &nbsp;&nbsp;&nbsp;&nbsp;**Proverbs 3:3**

A proverb is basically a simple and concrete saying. The idea is that it expresses a truth based on common sense or experience. Here I'm simply extending that idea to apply to how tools like RSpec use simple, concrete sayings -- in a particular context -- to express a truth. The "truth" in this case is the observable of a test.

Proverbs provides a very thin wrapper around RSpec that provides for more syntax possibilities and thus allows different modes of expression.

More specifically, Proverbs provides an internal DSL, similar to the [RSpec Story Runner](https://github.com/dchelimsky/rspec-stories), which was the predecessor of the [Cucumber](http://cukes.info/) external DSL provided by [Gherkin](http://cukes.info/gherkin.html). A goal of many of these tools is to put an emphasis on communication and they do so by making it somewhat easy to encode that communication as expressions. Tools like Cucumber focus on allowing communication via a description language that is structured by Gherkin keywords.

However, while the ideas behind Gherkin are viable, tools like Cucumber abstract away the nuts and bolts of your tests. Abstraction can be a good thing but Cucumber gives you no choice in the matter. It hides code blocks behind a "call by regular expression" invocation mechanism instead of making those code blocks readily available in the test description.

Proverbs lets you write as much logic beside your specifications as you want by leveraging the RSpec ecosystem with the addition of a Gherkin-like syntax. Beyond that, the syntax is not just limited to Gherkin.

## Installation

To get the latest stable release, add this line to your application's Gemfile:

```ruby
gem 'proverbs'
```

To get the latest code:

```ruby
gem 'proverbs', git: 'https://github.com/jeffnyman/proverbs'
```

After doing one of the above, execute the following command:

    $ bundle

You can also install Tapestry just as you would any other gem:

    $ gem install proverbs

## Usage

To use Proverbs you simply have to require it within your `spec_helper` file:

```ruby
require 'proverbs'
```

You can then use the DSL that Proverbs provides to structure your tests. Once you've done that, then you simply run your `rspec` command as normal against your test suite.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec:all` to run the tests. The default `rake` command will run all tests as well as a RuboCop analysis. To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/jeffnyman/proverbs](https://github.com/jeffnyman/proverbs). The testing ecosystem of Ruby is very large and this project is intended to be a welcoming arena for collaboration on yet another test-supporting tool. As such, contributors are very much welcome but are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

The Proverbs gem follows [semantic versioning](http://semver.org).

To contribute to Proverbs:

1. [Fork the project](http://gun.io/blog/how-to-github-fork-branch-and-pull-request/).
2. Create your feature branch. (`git checkout -b my-new-feature`)
3. Commit your changes. (`git commit -am 'new feature'`)
4. Push the branch. (`git push origin my-new-feature`)
5. Create a new [pull request](https://help.github.com/articles/using-pull-requests).

## Author

* [Jeff Nyman](http://testerstories.com)

## Credits

Proverbs has been inspired by the following projects:

* [maniok_bdd](https://github.com/21croissants/maniok_bdd)
* [rspec-gherkin](https://github.com/sheerun/rspec-gherkin)
* [rspec example steps](https://github.com/railsware/rspec-example_steps)
* [rspec-steps](https://github.com/LRDesign/rspec-steps)
* [rspec-given](https://github.com/jimweirich/rspec-given)
* [XSpec](https://github.com/xaviershay/xspec)

## License

Proverbs is distributed under the [MIT](http://www.opensource.org/licenses/MIT) license.
See the [LICENSE](https://github.com/jeffnyman/proverbs/blob/master/LICENSE.md) file for details.
