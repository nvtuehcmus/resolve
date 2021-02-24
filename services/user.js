const bcrybt =require('bcrypt');
const user={
hashPassWord:(password)=>{
        return bcrybt.hashSync(password,10);
    },
verifyPassWord:(password,passwordhash)=>{
        return bcrybt.compareSync(password,passwordhash);
    },
}
module.exports = user;