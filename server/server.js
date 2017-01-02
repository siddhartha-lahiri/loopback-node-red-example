var loopback = require('loopback');
var boot = require('loopback-boot');

var app = module.exports = loopback();
var RED = require('node-red');

app.start = function() {
  // start the web server
  return app.listen(function() {
    app.emit('started');
    var baseUrl = app.get('url').replace(/\/$/, '');
    console.log('Web server listening at: %s', baseUrl);
    if (app.get('loopback-component-explorer')) {
      var explorerPath = app.get('loopback-component-explorer').mountPath;
      console.log('Browse your REST API at %s%s', baseUrl, explorerPath);
    }
  });
};

boot(app, __dirname, function(err) {
    if (err) throw err;
    if (require.main === module) {
        var server = app.start();
        var settings = {
          flowFilePretty: true,
          httpAdminRoot:"/admin",
          httpNodeRoot: "/",
          userDir:"/data",
          functionGlobalContext: {
            fs:require('fs'),
            moment:require('moment'),
            loopback: app
          }
        };
        RED.init(server, settings);
        app.use(settings.httpAdminRoot, RED.httpAdmin);
        app.use(settings.httpNodeRoot, RED.httpNode);
        RED.start();
    }
});