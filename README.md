# Band Schedule README


## Installation


Retrieve the included Gemfile and Run the following command
```
bundle install
```

## Usage

To use the app run

```
postgres
```

Run postgres in your terminal

```
rake db:create
```

From there you will create three tables which will hold the data for your project. You just need to run the migration in order to set up the tables. 

```
ruby app.rb
```
Navigate in your browser to localhost:4567. Once the page loads you can either start with adding bands or venues to your lists. From there you can add additional bands or update the name of the band should you have an error. You can also delete the entry if you change your mind. Once you create venues and band names you can then add them to each other. For example, add bands to a venue you created so you can see which bands are going to that venue.

### Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as
possible to help us fixing the possible bug. We also encourage you to help even more by forking and
sending us a pull request.

## Maintainers
1. Andrew Lee (https://github.com/andrewlhy)
## License
MIT License. Copyright 2015
