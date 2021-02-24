const project={
    findByUserId:'select * from "teams" where member =  $1',
    findById:'select * from "project" where id =  $1',
    getProject:'select * from "project" where id in (select project from "teams" where member =  $1)',
}
module.exports= project;
