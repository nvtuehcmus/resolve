const express = require('express');
const projectQuery = require('../repository/query/project');
const projectMutation = require('../repository/mutation/project');
const asyncHandler = require('express-async-handler');
const teamsMutation = require('../repository/mutation/teams');
const teamsQuery = require('../repository/query/teams');
const userQuery = require('../repository/query/user');
const db = require('../model/db');
const router =express.Router();

router.get('/',async(req,res)=>{
    if(req.session.userId){
        const teams = await db.any(projectQuery.findByUserId,req.session.userId);
        const projects  = await db.any(projectQuery.getProject,req.session.userId);
        // let roles=[];
        // await new Promise((res,rej)=>{
        //     let count = 0
        //     teams.map(async (element) => {
        //         const project = await db.any(projectQuery.findByUserId,req.session.userId);
        //         roles.push(project);
        //         count++
        //         console.log(teams.length )
        //         if (count === teams.length ) {
        //             res()
        //         }
            
        // })
             
            
        // });
        //  console.log(`
         
         
         
         
        //  hghghghg`, roles)
        return res.render('project',{data:projects,role:teams});
     }
    res.render('index');
});
router.post('/',asyncHandler(async(req,res)=>{
    if(req.session.userId){
  
        if(req.body.projectName && req.body.description){
            const id = await db.one(projectMutation.createProject,[req.body.projectName,req.body.description]);
            await db.none(teamsMutation.createTeam,[id.max,req.session.userId,'PM']);

            const teams = await db.any(projectQuery.findByUserId,req.session.userId);
            const projects  = await db.any(projectQuery.getProject,req.session.userId);
            return res.render('project',{data:projects,role:teams});
        }
        const teams = await db.any(projectQuery.findByUserId,req.session.userId);
        const projects  = await db.any(projectQuery.getProject,req.session.userId);
        return res.render('project',{data:projects,role:teams});
     }
    res.render('index');
}));

router.get('/:id',async(req,res)=>{

    const project = await db.one(projectQuery.findById,req.params.id);

    const team = await db.any(teamsQuery.getByProjectId,req.params.id);

    const members = await db.any(teamsQuery.getMemberByProjectId,req.params.id);
    const allUser = await db.any(userQuery.findAll);
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.id]);

    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        return res.render('project-main',{data:{
            project:project,
            team:team,
            members:members,
            allUser:allUser, 
            permission:1,
            projectId:req.params.id
        }})
    }
    else{
        return res.render('project-main',{data:{
            project:project,
            team:team,
            members:members,
            permission:0,
            projectId:req.params.id
        }})
    }
});
router.get('/:project/delete/:id',async(req,res)=>{
    const userID = req.params.id.replace(' ', '');
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);
    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        await db.none(teamsMutation.deleteMember,[req.params.project,userID]);
    }
    return res.redirect('/project/'+req.params.project);
});

router.post('/:id/invite',async(req,res)=>{
    if(req.body.memberEmail && req.body.memberRole){
        const email = req.body.memberEmail.replace(' ', '');
        const members = await db.any(teamsQuery.getMemberByProjectId,req.params.id);
        const member = await db.one(userQuery.findByEmail,email);
        for(let i=0;i<members.length;i++){
            if(email === members[i].email){
                return res.redirect('/project/'+req.params.id);
     
            }
        }
        await db.none(teamsMutation.inviteMember,[req.params.id,member.id,req.body.memberRole]);
        return res.redirect('/project/'+req.params.id);

    }
    return res.redirect('/project/'+req.params.id);
});



module.exports = router;