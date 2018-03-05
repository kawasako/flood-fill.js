const fs = require('fs')
const exec = require('child_process').exec;
const files = ['./src/flood-fill.wat'];

run();

files.forEach(function (file) {
  fs.watch(file, function (event, filename) {
    console.log('build: ' + filename);
    run();
  });
});

function run() {
  exec('npm run build', function (err, stdout, stderr) {
    console.log(stdout);
    console.error(stderr);
  });
}
