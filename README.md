# The Gilded Rose

This is a refactoring exercise, with one simple goal: **implement the skipped tests**. To do this, you'll need to do one of two things:

1. Using superhuman programming skills, modify the monstrous `#tick` method to somehow make all the tests pass.
2. Refactor your way to a sensible architecture, and then implement the requirements.

The choice is yours.

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
git checkout -b my-new-branch problem
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

There are many solutions to this exercise on the Web. Try to solve the problem yourself before visiting any of these links below.

This repository is a fork of [Jim Weirich's](https://github.com/jimweirich/gilded_rose_kata), which is itself a Ruby port of the challenge presented in [this blog post](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). Sandi Metz provides an excellent example of the refactoring in [a talk](https://youtu.be/8bZh5LMaSmE) from RailsConf 2014.
