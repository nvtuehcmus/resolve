const user={
    findByEmail:'select * from "user" where email = $1',
    findById:'select * from "user" where id = $1',
    findToken:'select * from "user" where token = $1',
    numberOfUser:'select count(*) from "user"',
    findAll:'select * from "user"'
}
module.exports= user;
