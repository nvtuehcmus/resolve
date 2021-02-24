const teams = {
    getByProjectId:'select * from "teams" where project = $1', 
    getMemberByProjectId:'select * from "user" where id in (select member from "teams" where project = $1)',
    getRole:'select *from "teams" where member = $1 and project =$2'
}
module.exports = teams;