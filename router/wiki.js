const express = require('express');
const wikiMutation = require('../repository/mutation/wiki');
const wikiQuery = require('../repository/query/wiki');
const teamsQuery = require('../repository/query/teams');
const db = require('../model/db');
const router = express.Router();

router.get('/:project/document',async(req,res)=>{
    let wiki;
    try {
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    } catch (error) {
        await db.none(wikiMutation.createWiki,req.params.project);
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    }
    

    return res.render('enginer-wiki',{data:wiki});
});
router.get('/:project/infrastructure',async(req,res)=>{
    let wiki;
    try {
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    } catch (error) {
        await db.none(wikiMutation.createWiki,req.params.project);
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    }
    

    return res.render('wiki-infrastructure',{data:wiki});
});

router.get('/:project/guide',async(req,res)=>{
    let wiki;
    try {
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    } catch (error) {
        await db.none(wikiMutation.createWiki,req.params.project);
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    }
    

    return res.render('wiki-guide',{data:wiki});
});

router.get('/:project/code-base',async(req,res)=>{
    let wiki;
    try {
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    } catch (error) {
        await db.none(wikiMutation.createWiki,req.params.project);
        wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    }
    

    return res.render('wiki-code-base',{data:wiki});
});


router.post('/:project/document',async(req,res)=>{
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);

    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        const wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
        if(req.body.content != wiki.docs){
            await db.none(wikiMutation.insertDocs,[req.body.content,wiki.id]);
        }
    }
    return res.redirect('/wiki/'+req.params.project+'/document');
});
router.post('/:project/infrastructure',async(req,res)=>{
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);

    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        const wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
        if(req.body.content != wiki.infrastructure){
            await db.none(wikiMutation.insertInfrastructure,[req.body.content,wiki.id]);
        }
   
    }
return res.redirect('/wiki/'+req.params.project+'/infrastructure');
});

router.post('/:project/guide',async(req,res)=>{
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);

    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        const wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
        if(req.body.content != wiki.guide){
            await db.none(wikiMutation.insertGuide,[req.body.content,wiki.id]);
        }
   
    }

return res.redirect('/wiki/'+req.params.project+'/guide');
});

router.post('/:project/code-base',async(req,res)=>{
    const currentUser =  await db.one(teamsQuery.getRole,[req.session.userId,req.params.project]);

    if(currentUser.role == 'PM' || currentUser.role == 'CTO'|| currentUser.role == 'TL' ){
        const wiki = await db.one(wikiQuery.findByProjectId,req.params.project);
    if(req.body.content != wiki.code_base){
        await db.none(wikiMutation.insertCodeBase,[req.body.content,wiki.id]);
    }
   
    }
   
return res.redirect('/wiki/'+req.params.project+'/code-base');
});


module.exports = router;