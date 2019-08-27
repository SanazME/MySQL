var faker = require('faker');

// console.log(faker.name.findName());
// console.log(faker.date.past());
// console.log(faker.date.future());
// console.log(faker.date.between('2013-01-01', '2017-02-02'));

for (var i = 0; i < 10; i++) {
    console.log(faker.internet.email());
    console.log(generateAddress());
    console.log(' ')
}

function generateAddress() {
    return faker.address.streetAddress() + ' ' + faker.address.city() + faker.address.state();
}

