const teams = {
    createTeam:'insert into "teams"(project,member,role) values($1,$2,$3);select MAX(id) from "teams"', 
    inviteMember:'insert into "teams"(project,member,role) values($1,$2,$3)',
    deleteMember:'delete from "teams" where project = $1 and member = $2'
}
module.exports = teams;