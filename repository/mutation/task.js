const task={
    done:'update "task" SET status = status+1 WHERE id = $1',
    reject:'update "task" SET status = status-1 WHERE id = $1',
    
}
module.exports= task;
