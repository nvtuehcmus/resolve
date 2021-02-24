const wiki = {
    createWiki:'insert into "enginer_wiki"(project) values($1)',
    insertDocs:'update "enginer_wiki" set docs = $1 where id = $2',
    insertInfrastructure:'update "enginer_wiki" set infrastructure = $1 where id = $2',
    insertGuide:'update "enginer_wiki" set guide = $1 where id = $2',
    insertCodeBase:'update "enginer_wiki" set code_base = $1 where id = $2',
}
module.exports = wiki;