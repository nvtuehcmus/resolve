const express = require('express');
const db = require('../model/db');
const userMutation = require('../repository/mutation/user');
const userQuery = require('../repository/query/user');
const asyncHandler = require('express-async-handler');

const router = express.Router();

router.get('/',(req,res)=>{
    res.redirect('/');
})
router.get('/:email/:token',asyncHandler(async(req,res)=>{

    if(req.session.userId){
        return res.redirect('/');
    }
    else{
    const email = req.params.email;
    const token = req.params.token;

    const user = await db.oneOrNone(userQuery.findByEmail,email);
    if(user != null){
        if(user.token == token){
            await db.none(userMutation.active,user.id);
            return res.redirect('/');
        }
        else{
            return res.redirect('/');
        }

    }
    else{
        return res.redirect('/');
    }
}
}));

module.exports = router;