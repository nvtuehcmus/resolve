const task={
    taskDone:'select count(*) from "task" where assign = $1 and status = 5',
    allTask:'select count(*) from "task" where assign = $1',
    allTaskInProject:'select count(*) from "task" where project = $1',
    findById:'select * from "task" where id = $1',
    findBySprint:'select * from "task" where project = $1 and sprint = $2',
    findByLevel:'select * from "task" where project = $1 and sprint = $2 and status = $3'
}
module.exports= task;
