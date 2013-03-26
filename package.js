try {
    Package.describe({
        summary: "Testing framework for Observatory Suite"
    });

    Package.on_use(function (api) {
        api.use(['coffeescript', 'bootstrap', 'underscore','templating','less'], 'client');

        api.add_files('client/lib/chai.js','client');

        api.add_files([
            'mtest.coffee',
            'sampleTests.coffee',
            'client/simpleTests.html',
            'client/mtestsTemplates.coffee'
        ], 'client');

        api.add_files('mtest.coffee','server');
        api.add_files('sampleTests.coffee','server');
    });
}
catch (err) {
    console.log("Error while trying to load a package: " + err.message);
};
