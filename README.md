# Letterboxd API client

This is a simple Ruby script that can access much of the Letterboxd v0 API. 

Please don’t treat it as a reference implementation. It was adapted from a very early test harness and is in sore need of tidying up :-)

Although the Letterboxd API isn’t public yet (as at 2017-06-12), we have seeded some developers with API keys. If you’re one of the beta testers, please fill in your API_KEY and API_SECRET that were provided to you in ```examples.rb```.

Hope this helps. Comments, pull requests, etc welcome.

Grant Berridge
Lead developer, Letterboxd.
(Not a Ruby developer)

## Installation

If you already have Ruby, you should be good to go.

You may need to install Bundler, and there will certainly be many other yaks to shave. Once your Ruby system is moderately healthy:

```
git clone https://github.com/grantyb/letterboxd-api-example-ruby-client.git
cd letterboxd-api-example-ruby-client
bundle install
ruby examples.rb
```

This should result in this error:

```
/…/letterboxd-api-example-ruby-client/ruby-client/services/auth.rb:10:in 'login': Unable to log in (RuntimeError)
	from examples.rb:22:in '<main>'
```

If that’s what you see, then you’re nearly ready. Edit the `examples.rb` file to add your own API key where it has `YOUR_KEY_HERE`, your API secret where it has `YOUR_SECRET_HERE`, and also put your own username where it has `YOUR_USERNAME_HERE` and your password instead of `YOUR_PASSWORD_HERE`.

Try again:

```
ruby examples.rb
```

You should now see a fairly detailed JSON response.

## More information

For more information, please get in touch with api@letterboxd.com.
