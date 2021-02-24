const sprint ={
    getAllByProject:'select * from "sprint" where project = $1',
    getCurrentSprint:'select * from "sprint" where project = $1 and status = 1',
    getSprintsIsNotActive:'select * from "sprint" where project = $1 and status = 0',
    findById:'select * from "sprint" where id = $1',
}
module.exports = sprint