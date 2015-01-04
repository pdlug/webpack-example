# Webpack example (w/ gulp, coffee, backbone, and foundation)

Example app I developed to demonstrate the use of webpack (via gulp) as a build
tool. Demonstrates several features of webpack including multiple entry points,
common chunk extraction, dev server, etc. The example app is a backbone app
written in coffeescript and using Zurb Foundation for styles.

Components used:

* [Gulp](http://gulpjs.com/) + [webpack](http://webpack.github.io/) to build assets
* [Coffeescript](http://coffeescript.org/)
* [Backbone.js](backbonejs.org) 
* [Foundation](http://foundation.zurb.com/)

## Project structure

```
/<root>
    /app          # backbone app
        /admin    # Administration application
        /base     # Top level base classes for the application(s)
        /data     # JSON data so we don't have an API dependency
        /models   # Backbone models/collections
        /styles   # Source for CSS (using SCSS)
        /views    # Backbone views + templates
    /assets       # Static assets like HTML pages (just enough to bootstrap the JS app)
    gulpfile.coffee
    webpack.config.coffee
```

## Getting started

[Gulp](http://gulpjs.com/) is used as the build tool, install it globally unless
you prefer to use `./node_modules/gulp/bin/gulp.js` everywhere you see `gulp`.

`npm install -g gulp`

Install npm packages:

`npm install`

Install bower packages (for Foundation):

`bower install`

Start the dev server/watcher:

`gulp watch`

This starts a server on [http://localhost:8080/](http://localhost:8080/) which 
will serve the contents of `public` and rebuild the app(s) when any of the files
change.

## Gulp tasks

* **build** - production level build enabling optimizations like deduplication and uglifyjs
* **build-dev** - development build with source maps and debug enabled (w/o any production level optimizations)
* **watch** (*default*) - starts a webpack development server which will watch for changes and rebuild on demand

## Example App

It might be overkill but the sample app supplied is a backbone app implementing
a photo gallery with an admin tool (functionality stubbed out). This demonstrates
two entry points for the app: the end user facing homepage/photo pages and the
admin tool. The webpack configuration builds separate JS files for each of these
entry points and factors out the functionality they share into a common chunk
file (`common.js`). Both the main app and admin templates include `common.js`
along with their app specific code (`app.js` or `admin.js`).


## Highlights

Various features of webpack are demonstrated including:

* Embedding static JSON data with [json-loader](https://github.com/webpack/json-loader)
* Definition of multiple entry points w/ common chunks extracted to a separate file
* CSS written in SCSS using the Foundation framework, loaded via webpack `style-loader`

## Author

[Paul Dlug](http://pauldlug.com/), feel free to contact me with questions/feedback.


## Credits

The backbone app structure and various helpers were heavily influenced by
[Chaplin](http://chaplinjs.org/).

Various gulp/webpack configs:

* [frontend-starterkit-webpack](https://github.com/starterkits/frontend-starterkit-webpack)
* Pete Hunt's [webpack-howto](https://github.com/petehunt/webpack-howto)

## Known Issues

* Changing a file in `assets` does not trigger a re-copy when running the dev server.
