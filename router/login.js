const express = require('express');
const asyncHandler = require('express-async-handler');
const service = require('../services/user');
const projectQuery = require('../repository/query/project');
const taskQuery = require('../repository/query/task');
const userQuery = require('../repository/query/user');
const db = require('../model/db');
const router =express.Router();

router.get('/',async(req,res)=>{
    if(req.session.userId){
        const teams = await db.any(projectQuery.findByUserId,req.session.userId);
        const projects  = await db.any(projectQuery.getProject,req.session.userId);
        const allTask = await db.one(taskQuery.allTask,req.session.userId);

        const taskDone = await db.one(taskQuery.taskDone,req.session.userId);
        const numberOfUser = await db.one(userQuery.numberOfUser);
        const user =  await db.one(userQuery.findById,req.session.userId);
        return res.render('home',{data:projects,role:teams,users:numberOfUser.count,user:user,task:{all:allTask.count,done:taskDone.count}});
     }
    res.render('index');
})

router.post('/',asyncHandler(async (req,res)=>{ 
    const User = await db.oneOrNone(userQuery.findByEmail,req.body.username);
    if(User==null||!service.verifyPassWord(req.body.pwd,User.password)&&User.token == null){
        return res.redirect('/');
    }
    else if(User.token!=null){
        return res.render('verify');
    }
    req.session.userId=User.id;
    const teams = await db.any(projectQuery.findByUserId,req.session.userId);
    const projects  = await db.any(projectQuery.getProject,req.session.userId);
    const allTask = await db.one(taskQuery.allTask,req.session.userId);

    const taskDone = await db.one(taskQuery.taskDone,req.session.userId);
    const numberOfUser = await db.one(userQuery.numberOfUser);
    const user =  await db.one(userQuery.findById,req.session.userId);
    return res.render('home',{data:projects,role:teams,users:numberOfUser.count,user:user,task:{all:allTask.count,done:taskDone.count}});
   
}));

module.exports = router;