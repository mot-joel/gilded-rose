# The Gilded Rose

This is a refactoring exercise, with one simple goal: **implement the skipped tests**. To do this, you'll need to do one of two things:

1. Using superhuman programming skills, modify the monstrous `#tick` method to somehow make all the tests pass.
2. Refactor your way to a sensible architecture, and then implement the requirements.

The choice is yours.

### Bonus

Refactor the tests, too!

## Getting started

1. Clone or fork the repository

```
git clone https://github.com/jreut/gilded-rose
```
or

```
hub fork jreut/gilded-rose
```

2. Checkout the HEAD of the `problem` branch

```
git checkout -b my-solution problem
```

3. Install dependencies

```
bundle install
```

4. Start refactoring!

```
bundle exec guard
```

## Meta

### RSpec vs Minitest

It doesn't matter which testing framework you use[1][]; it just matters that you test your code. I've included a modified version of the original RSpec specs from Jim Weirich and also some equivalent Minitest tests. Just because Minitest is a little lighter-weight and perhaps easier for testing newcomers to understand, I made Minitest the default for this project. If you'd like to switch to RSpec, just uncomment the appropriate sections of the Gemfile and Guardfile.

### Bonus Extra Credit!!!

These tests (especially the Minitest ones I wrote) are pretty badly organized. I agree with Sandi Metz's sentiment that if your tests are hard to write, your architecture is wrong. Once you have solved this exercise, rewrite the tests for extra points!

### History

There are many solutions to this exercise on the Web. Try to solve the problem yourself before visiting any of these links below.

This repository is a fork of [Jim Weirich's](https://github.com/jimweirich/gilded_rose_kata), which is itself a Ruby port of the challenge presented in [this blog post](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). Sandi Metz provides an excellent example of the refactoring in [a talk](https://youtu.be/8bZh5LMaSmE) from RailsConf 2014.

[1]: http://tenderlovemaking.com/2015/01/23/my-experience-with-minitest-and-rspec.html
