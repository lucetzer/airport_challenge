[![BuildStatus](https://travis-ci.org/lucetzer/airport_challenge.svg)](https://travis-ci.org/lucetzer/airport_challenge) [![CoverageStatus](https://coveralls.io/repos/lucetzer/airport_challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/lucetzer/airport_challenge?branch=master)


Airport Challenge
=================

Task
-----

The task for this challenge is to write a test-driven program to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Below are a list of key user stories:

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

How to run this program
-----------------------

1. Fork this repo and clone it
2. Run ```gem install bundle```
3. For testing, run ```rspec```
4. Create airports and planes, see example provided below.

```
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x007ff0320b9d00 @planes=[], @capacity=10, @weather=#<Weather:0x007ff0320b9c88>>
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007ff0320b02c8 @flying=true>
2.2.3 :003 > airport.dock plane
 => [#<Plane:0x007ff0320b02c8 @flying=false>]
```

Technologies used
------------------

* Ruby
* Testing - Rspec


Key Learnings
-------------

* SOLID principles of object-oriented design especially that classes/methods should have one responsibility(Single Responsibility Principle) and use of dependency injection.
* Doubling and stubbing techniques to ensure independent testing.
