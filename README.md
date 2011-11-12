Tesluca Roadmap
===========

Currently pre-alpha.

Here's where Tesluca is headed:

- An application suitable for lean innovation accounting, user activity logging, and click tracking
- Stores data in Cassandra schema suitable for generic user activity logging 
- View ad hoc reports via a Sinatra app. Suitable for running as a Rack app solo or in a Rails app similar to Resque. [See Rails Cast 271](http://railscasts.com/episodes/271-resque)
- Core technologies Ruby, jQuery, Coffeescript, Minitest, Jasmine
- Very fast installation, configurable for multi-node Cassandra clusters
- Various methods for tracking user activity: Ruby code, Javascript, pixel image parameters 
- Remain radically simple

Setup and Usage
============

* use Ruby 1.9.2 
* from the root of the project install the gems with: 
    
    bundle install

* setup cassandra: 
    
    config/cassandra.yml should be pointing to your local instance

* start cassandra: 

    bin/cassandra -f # may need sudo

* setup the cassandra keyspace with: 
    
    rake ks:create:all

* run the cassandra ActiveColumn migrations with: 

    rake ks:migrations

* setup the test keyspace with: 
  
    rake ks:test:prepare

* run the specs with: 

    rake spec


Pitch In
===========

If you find this project interesting and want to contribute please send pull requests, get in touch with Noah, etc. Lean metrics expertise and skilled Cassandra, Ruby, and Coffeescript / jQuery development are espescially welcome. If you send a pull request please be sure to include tests.

About The Name
=======

Tesluca, the innovation accounting app, is named via a filtered string concatination of Nokola Tesla (electro/magnetic innovator) and Fra Luca Bartolomeo de Pacioli (Renaisance father of double entry accounting). An appropriate command line alias for Tesluca is "tlc".
