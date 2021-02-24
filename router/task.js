const express = require('express');
const asyncHandler = require('express-async-handler');
const taskMutation = require('../repository/mutation/task');
const taskQuery = require('../repository/query/task');
const userQuery = require('../repository/query/user');
const teamsQuery = require('../repository/query/teams');
const db = require('../model/db');
const dotenv = require('dotenv');
dotenv.config();


const router = express.Router();
router.get('/:project/:sprint',async (req,res)=>{
    let assigns = [];
    const tasks =  db.any(taskQuery.findBySprint,[req.params.project,req.params.sprint]);
    const notStart =   db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,0]);
    const inProgress =   db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,1]);
    const internalPreview =   db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,2]);
    const complete =   db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,5]);
    const currentUser =   db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    const getMemberByProjectId = db.any(teamsQuery.getMemberByProjectId,req.params.project);
    const result = await Promise.all([tasks,notStart,inProgress,internalPreview,complete,currentUser,getMemberByProjectId]);
            await new Promise((res,rej)=>{
            let count = 0
            result[0].map(async (task) => {
                let count = 0;
                const user = await db.oneOrNone(userQuery.findById,task.assign);

                if(user){
                    assigns.push(user);
                }
                count++;
                if(count == result[0].length){
                    res();
                }
            
        });
    });
    if(result[5].role == 'PM' || result[5].role == 'CTO'|| result[5].role == 'TL' ){
    return res.render('sprint-main',{
        data:{
        tasks:result[0],
        notStart:result[1].length,
        inProgress:result[2].length,
        internalPreview:result[3].length,
        complete:result[4].length,
        assigns:assigns,
        projectId:req.params.project,
        sprintId:req.params.sprint,
        members:result[6],
        permission:1}});
    }
    return res.render('sprint-main',{
        data:{
        tasks:result[0],
        notStart:result[1].length,
        inProgress:result[2].length,
        internalPreview:result[3].length,
        complete:result[4].length,
        assigns:assigns,
        members:result[6],
        projectId:req.params.project,
        sprintId:req.params.sprint,
        permission:0}});

});

//status
router.get('/:project/:sprint/notStart',async (req,res)=>{// sent status 1 to approve 0 reject

    let assigns = [];
    const tasks =  await db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,0]);
    if(tasks.length){
    await new Promise((res,rej)=>{
        let count = 0;
        tasks.map(async (task) => {
            let count = 0;
            const user = await db.oneOrNone(userQuery.findById,task.assign);

            if(user){
                assigns.push(user);
            }
            count++;
            if(count == tasks.length){
                res();
            }
        
    });});
    }
   return res.render('notStart',{data:{
    tasks:tasks,
    assigns:assigns,
    projectId:req.params.project,
    sprintId:req.params.sprint
   }});


});
router.get('/:project/:sprint/inProgress',async (req,res)=>{// sent status 1 to approve 0 reject
    let assigns = [];
    const tasks =  await db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,1]);
    if(tasks.length){
    await new Promise((res,rej)=>{
        let count = 0;
        tasks.map(async (task) => {
            let count = 0;
            const user = await db.oneOrNone(userQuery.findById,task.assign);

            if(user){
                assigns.push(user);
            }
            count++;
            if(count == tasks.length){
                res();
            }
        
    });});
    }
   return res.render('inProgress',{data:{
    tasks:tasks,
    assigns:assigns,
    projectId:req.params.project,
    sprintId:req.params.sprint
   }});
});
router.get('/:project/:sprint/interalReview',async (req,res)=>{// sent status 1 to approve 0 reject

    let assigns = [];
    const tasks =  await db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,2]);
    if(tasks.length){
    await new Promise((res,rej)=>{
        let count = 0;
        tasks.map(async (task) => {
            let count = 0;
            const user = await db.oneOrNone(userQuery.findById,task.assign);

            if(user){
                assigns.push(user);
            }
            count++;
            if(count == tasks.length){
                res();
            }
        
    });});
    }
   return res.render('interalReview',{data:{
    tasks:tasks,
    assigns:assigns,
    projectId:req.params.project,
    sprintId:req.params.sprint
   }});
});
router.get('/:project/:sprint/bussinessReview',async (req,res)=>{// sent status 1 to approve 0 reject
    let assigns = [];
    let permission=0;
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    const tasks =  await db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,3]);
    if(tasks.length){
    await new Promise((res,rej)=>{
        let count = 0;
        tasks.map(async (task) => {
            let count = 0;
            const user = await db.oneOrNone(userQuery.findById,task.assign);

            if(user){
                assigns.push(user);
            }
            count++;
            if(count == tasks.length){
                res();
            }
        
    });});
    }
    
    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        permission=1;
    }
   return res.render('bussRe',{data:{
    tasks:tasks,
    assigns:assigns,
    projectId:req.params.project,
    permission:permission,
    sprintId:req.params.sprint
   }});

});
router.get('/:project/:sprint/codeReview',async (req,res)=>{// sent status 1 to approve 0 reject
    let assigns = [];
    let permission=0;
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    const tasks =  await db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,4]);
    if(tasks.length){
    await new Promise((res,rej)=>{
        let count = 0;
        tasks.map(async (task) => {
            let count = 0;
            const user = await db.oneOrNone(userQuery.findById,task.assign);

            if(user){
                assigns.push(user);
            }
            count++;
            if(count == tasks.length){
                res();
            }
        
    });});
    }
    
    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        permission=1;
    }
   return res.render('codeReview',{data:{
    tasks:tasks,
    assigns:assigns,
    projectId:req.params.project,
    permission:permission,
    sprintId:req.params.sprint
   }});

});
router.get('/:project/:sprint/complete',async (req,res)=>{// sent status 1 to approve 0 reject
    let assigns = [];
    let permission=0;
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    const tasks =  await db.any(taskQuery.findByLevel,[req.params.project,req.params.sprint,5]);
    if(tasks.length){
    await new Promise((res,rej)=>{
        let count = 0;
        tasks.map(async (task) => {
            let count = 0;
            const user = await db.oneOrNone(userQuery.findById,task.assign);

            if(user){
                assigns.push(user);
            }
            count++;
            if(count == tasks.length){
                res();
            }
        
    });});
    }
    
    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        permission=1;
    }
   return res.render('complete',{data:{
    tasks:tasks,
    assigns:assigns,
    projectId:req.params.project,
    permission:permission,
    sprintId:req.params.sprint
   }});
});
//end status

//method
router.get('/:project/:sprint/:id/done',async (req,res)=>{
    const task = await db.one(taskQuery.findById,req.params.id);
    await db.none(taskMutation.done,req.params.id);
    if(task.status==0){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/notStart');
    }
    else if(task.status==1){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/inProgress');
    }
    else if(task.status==2){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/interalReview');
    }
    else if(task.status==3){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/bussinessReview');
    }
    else if(task.status==4){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/codeReview');
    }
    else if(task.status==5){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/complete');
    }
});
router.get('/:project/:sprint/:id/reject',async (req,res)=>{
    const task = await db.one(taskQuery.findById,req.params.id);
    await db.none(taskMutation.reject,req.params.id);
    if(task.status==1){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/inProgress');
    }
    else if(task.status==2){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/interalReview');
    }
    else if(task.status==3){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/bussinessReview');
    }
    else if(task.status==4){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/codeReview');
    }
    else if(task.status==5){
        return res.redirect('/task/'+req.params.project+'/'+req.params.sprint+'/complete');
    }
});


router.get('create/:project/:sprint/:id',async (req,res)=>{// sent status 1 to approve 0 reject

    // if(req.params.id){
    //     await db.none(taskMutation.reject,req.params.id);
    // }  
    // const tasks = await db.any(taskQuery.findById,[req.params.project,req.params.sprint]);
    // return res.render('tasks',{data:tasks});

});

module.exports = router;