const express = require('express');
const userQuery = require('../repository/query/user');
const sprintQuery = require('../repository/query/sprint');
const sprintMutation =require('../repository/mutation/sprint');
const teamsQuery = require('../repository/query/teams');
const db = require('../model/db');
const moment = require('moment')
const router =express.Router();

router.get('/:project',async(req,res)=>{
    if(req.params.project){
        const sprints = await db.any(sprintQuery.getSprintsIsNotActive,req.params.project);
        const currentSprint = await db.oneOrNone(sprintQuery.getCurrentSprint,req.params.project)??{
            name:"Empty",
            description:"The active sprint is empty please active any sprint to do !",
            none:1

        };
       sprints.map(sprint=>{
           sprint.start =  moment(sprint.start).format('yyyy-MM-DD').toString();
           sprint.end =  moment(sprint.end).format('yyyy-MM-DD').toString();
        });

        currentSprint.start =  moment(currentSprint.start).format('yyyy-MM-DD').toString();
        currentSprint.end =  moment(currentSprint.end).format('yyyy-MM-DD').toString();

        const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
        if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
            return res.render('sprint',{data:{
                sprints:sprints,
                currentSprint:currentSprint,
                permission:1,
                projectId:req.params.project
            }})
        }
        return res.render('sprint',{data:{
            sprints:sprints,
            currentSprint:currentSprint,
            permission:0,
            projectId:req.params.project
        }})
    }
    res.redirect('/');
});
router.post('/:project/create',async(req,res)=>{
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
        if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
           await db.none(sprintMutation.create,[
               req.params.project,
               req.body.sprintName,
               req.body.sprintStart,
               req.body.sprintEnd,
               req.body.sprintDescription]);
        }
    return res.redirect('/sprint/'+req.params.project);
})
router.get('/:project/delete/:id',async(req,res)=>{
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
       await db.none(sprintMutation.delete,req.params.id);
    }
   return  res.redirect('/sprint/'+req.params.project);
   
})
router.get('/:project/active/:id',async(req,res)=>{
    const sprint = await db.one(sprintQuery.findById,req.params.id);
    const currentSprint = await db.oneOrNone(sprintQuery.getCurrentSprint,req.params.project);
    if(currentSprint || (sprint.end -Date.now())<=0){
        return res.redirect('/sprint/'+req.params.project);
    }
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
       await db.none(sprintMutation.active,req.params.id);
    }
    return res.redirect('/sprint/'+req.params.project);
   
})
router.get('/:project/complete',async(req,res)=>{

    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
        if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
           await db.none(sprintMutation.complete);
        }
    return res.redirect('/sprint/'+req.params.project);
})
module.exports = router;