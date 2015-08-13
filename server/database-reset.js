/*
* from https://github.com/Sanjo/meteor-jasmine/wiki/Database-Fixtures-for-Integration-Tests
* */
if (process.env.IS_MIRROR) {
    Meteor.methods({
        'loadFixtures': function(){
            console.log('Loading default fixtures');
            // add your fixtures here
            Accounts.createUser({
                email: 'davide@fantanarchist.com',
                password: '123456'
            });

            Accounts.createUser({
                email: 'admin@fantanarchist.com',
                password: 'adidas85'
            });

            [{name: "Francesco Totti", team: "Roma", role: "F"},
                {name: "Mauro Icardi", team: "Inter", role: "F"},
                {name: "Marco Materazzi", team: "Inter", role: "D"},
                {name: "Ale Nesta", team: "Milan", role: "D"},
                {name: "Daniele DeRossi", team: "Roma", role: "M"},
                {name: "Darko Kuzmanovic", team: "Inter", role: "M"},
                {name: "Gigi Buffon", team: "Juventus", role: "G"},
                {name: "Sergio Romero", team: "Sampdoria", role: "G"}
            ].forEach(function (data){
                Footballers.insert(data)
            });
            console.log('Finished loading default fixtures');
        },

        'clearDB': function(){
            console.log('Clear DB');
            Mongo.users.update({}, {$set:{"profile.players":[]}}, {multi:true});
            var collectionsRemoved = 0;
            var db = Meteor.users.find()._mongo.db;
            db.collections(function (err, collections) {

                var appCollections = _.reject(collections, function (col) {
                    return col.collectionName.indexOf('velocity') === 0 ||
                        col.collectionName === 'system.indexes';
                });

                _.each(appCollections, function (appCollection) {
                    appCollection.remove(function (e) {
                        if (e) {
                            console.error('Failed removing collection', e);
                            fut.return('fail: ' + e);
                        }
                        collectionsRemoved++;
                        console.log('Removed collection');
                        if (appCollections.length === collectionsRemoved) {
                            console.log('Finished resetting database');
                        }
                    });
                });

            });

            console.log('Finished clearing');
        }
    });
}