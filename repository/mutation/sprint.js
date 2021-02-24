const sprint ={
    active:'update "sprint" SET status = 1 WHERE id = $1',
    complete:'update "sprint" SET status = 0 WHERE status = 1',
    delete:'delete from "sprint" WHERE id = $1',
    create:'insert into "sprint"("project","name","start","end","description","status") values($1,$2,$3,$4,$5,0);' 
}
module.exports = sprint;