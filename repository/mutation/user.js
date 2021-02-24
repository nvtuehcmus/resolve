const user={
    createUser: 'insert into "user"(id,email,name, password,token) values(DEFAULT,$1,$2,$3,$4)',
    active:'update "user" SET token = null WHERE id = $1',
    updateProfile:'update "user" set name=$1, position = $2, department = $3, address = $4, day_of_birth = $5;select * from "user" where id = $6'
}
module.exports= user;
