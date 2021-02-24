const project ={
createProject:'insert into "project"(name,description) values($1,$2)',
}
module.exports = project;