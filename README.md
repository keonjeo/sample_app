# README

# Ruby on Rails Tutorial sample application

## License

  Keon-Ye License, without keon-ye's permission, please don't copy it.


## Getting started


To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```


Next, migrate the database:

```
$ rails db:drop db:create db:migrate db:seed
```


Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```


If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server -b 0.0.0.0 -p 3000
```

