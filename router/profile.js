const express = require('express');
const asyncHandler = require('express-async-handler');
const service = require('../services/user');
const userQuery = require('../repository/query/user');
const userMutation = require('../repository/mutation/user');
const db = require('../model/db');
const moment = require('moment')
const router =express.Router();

router.get('/',async(req,res)=>{
    if(req.session.userId){
        let user = await db.oneOrNone(userQuery.findById,req.session.userId);
        user.day_of_birth =  moment(user.day_of_birth).format('yyyy-MM-DD').toString();
        return res.render('profile',{data:user})
     }
     
    res.render('index');
})
router.post('/',asyncHandler(async (req,res)=>{ 
    const User = {
        name:req.body.name,
        position:req.body.position,
        department:req.body.department,
        address:req.body.address,
        day_of_birth:req.body.day_of_birth
    };
    const user = await db.oneOrNone(userMutation.updateProfile,[User.name,User.position,User.department,User.address,User.day_of_birth,req.session.userId]);
    user.day_of_birth =  moment(user.day_of_birth).format('yyyy-MM-DD').toString();
        return res.render('profile',{data:user??User});

}));

module.exports = router;