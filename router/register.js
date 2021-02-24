const express = require('express');
const asyncHandler = require('express-async-handler');
const service = require( '../services/user');
const userQuery = require('../repository/query/user');
const userMutation = require('../repository/mutation/user');
const db = require('../model/db');
const crypto = require('crypto');
const form = require('../services/form');
const {send} = require('../services/mail');
const dotenv = require('dotenv')
dotenv.config();


const router =express.Router();
router.get('/',(req,res)=>{
    if(req.session.userId){
       return res.redirect('/home');
    }
    res.redirect('/');
})
router.post('/',asyncHandler(async (req,res)=>{
    const user = await db.any(userQuery.findByEmail,req.body.email);

    
    if(user.length == 0){
        const checkPass = /^([\x2B-\x39]|[\x41-\x7A]){6,}$/; //more than 6 digis
        const checkMail = /^([\x2B-\x39]|[\x41-\x7A]){1,}\x40([\x2B-\x39]|[\x41-\x7A]){1,}\x2E\w{1,}$/;

        if(checkMail.test(req.body.email) && checkPass.test(req.body.password)){
            const token =crypto.randomBytes(4).toString('hex').toUpperCase();
            await db.none(userMutation.createUser,([
                req.body.email,
                req.body.fullname,
                service.hashPassWord(req.body.password),
                token
            ]
            ))
            
            const url = `http://localhost:${process.env.PORT}/verify/${req.body.email}/${token}`
            await send(req.body.email,"Xác nhận địa chỉ email",form.verify(url));
            return res.render('verify');
        }else{
            return res.json({"error":"password need more than 6 character and not symbols or your email not corect"});
        }
    }
    else if(user.token!=null){
        return res.render('verify');
    }
    
    req.session.userId=user.id;
    res.redirect('/home')
}));


module.exports = router;