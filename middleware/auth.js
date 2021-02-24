const db = require('../model/db');
const userQuery = require('../repository/query/user');
module.exports=(async function auth(req,res,next){
    const userId = req.session.userId;
    res.locals.currentUser = null;
    if(!userId){
        res.redirect('/')
        return 
    }
    const user = await db.oneOrNone(userQuery.findById,userId);
    if(user == null){
        res.status(404)
        return 
    }
    req.currentUser=user;
    res.locals.currentUser=user;
    next();
});