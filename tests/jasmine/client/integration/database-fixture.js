/*
* from https://github.com/Sanjo/meteor-jasmine/wiki/Database-Fixtures-for-Integration-Tests
* */

Meteor.call('clearDB', function(){
    Meteor.call('loadFixtures');
});