# Form Intro

## Target

The username and password is on Canvas — here is our target:

[https://form-intro.matchthetarget.com/](https://form-intro.matchthetarget.com/)

## Query strings

The essential piece: add a **query string** onto _any_ URL in your Rails app, e.g.

```
/rock?dessert=Ice cream&color=Orange
```

and watch what happens in your server log when you visit that URL.

Rails parses any query string parameters and puts them into a special Hash called `params`. You have access to `params` in the action.

With that simple fact, combined with the way that HTML forms behave, we can invent ways to make any forms we want work!

## Your first task

Wire up the following 4 RCAVs and add `<h1>` elements to each that say "Addition", "Subtraction", "Multiplication", and "Division":

 - `/add`
 - `/subtract`
 - `/multiply`
 - `/divide`

Use the [slides](https://slides.com/raghubetina/07-routing?token=Qj5aA5z3), [chapter](https://chapters.firstdraft.com/chapters/779), and your RPS RCAV workspace as a reference.

## Your second task

Visit your `/add` URL, but type a query string on to the end: `?first_num=3&second_num=4`. So, the whole path should be:

```
/add?first_num=3&second_num=4
```

First pull up the Terminal tab running your server and Cmd-K or Ctrl-K to clear it out, then visit that URL again. Scroll to the top of the Terminal tab. Read the log — what do you notice?

The `params` Parameters `Hash`! Use the `params` hash in the action you defined to calculate a result and display it in the view template you created. Make the markup [match the target](https://form-intro.matchthetarget.com/add?first_num=3&second_num=4).

## Do the other 3

Do the same thing for 

 - `/subtract`,
 - `/multiply`,
 - and `/divide`.

## Review form attributes

Remember when we [reverse engineered HTML forms](https://slides.com/raghubetina/04-essential-html-and-css?token=TunUbuP_#/11)? Review and remind yourself what each attribute does — `action`, `id`, `for`, `value`, `type`, `placeholder`, `name`.

## Add forms

Now, make it easier on your users. They should not have to type into the address bar of their browsers to access these useful calculations.

Can you invent a way to make it easier for them using what you've learned about RCAV, `params`, and what we reverse-engineered about how HTML forms work?

## Google Cloud Translate

 - [Google Cloud Translation](https://cloud.google.com/translate)

Here's the crux of using the official gem:

Add the gem to your Gemfile:

```ruby
# /Gemfile
gem "google-cloud-translate"
```

Then `bundle install` and restart your web server.

You now have access to the `Google::Cloud::Translate` class. To use it:

```ruby
require "google/cloud/translate"
gt_client = Google::Cloud::Translate.new({ :version => :v2 })
translation = gt_client.translate("Hello, world!", { :to => "es" })
```

Amazing!

To list all available languages,

```ruby
languages = gt_client.languages("en") # The argument determines what language to list the other language names in
languages.size #=> 104
languages[0].code #=> "af"
languages[0].name #=> "Afrikaans"
```

Read more at the gem docs:

 - [Ruby gem documentation](https://googleapis.dev/ruby/google-cloud-translate/latest/index.html#Using_the_legacy_v2_client)
