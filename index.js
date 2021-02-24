const express = require('express');
const cookieSession = require( 'cookie-session');      
const dotenv = require( 'dotenv');
const bodyParser = require('body-parser');  
const asyncHandler = require('express-async-handler'); //try catch asyn function
const path = require('path')    
dotenv.config(); // set environment variables

const app = express();
app.use(express.static(path.join( 'public')));
// app.use(express.static('public'));

app.use(cookieSession({
    name: 'session',
    keys:['1234'],
    maxAge: 60*60*10000, //a hour
}));

app.set('views','./views');
app.set('view engine','ejs');
app.use('/',bodyParser.urlencoded({ extended: false }),asyncHandler(require("./router/login")));
app.use('/register',bodyParser.urlencoded({ extended: false }),asyncHandler(require("./router/register")));
app.use('/verify',bodyParser.urlencoded({ extended: false }),require('./router/verify'));
app.use('/project',bodyParser.urlencoded({ extended: false }),require('./middleware/auth'),require('./router/project'));
app.use('/profile',bodyParser.urlencoded({ extended: false }),require('./middleware/auth'),require('./router/profile'));
app.use('/wiki',bodyParser.urlencoded({ extended: false }),require('./middleware/auth'),require('./router/wiki'));
app.use('/sprint',bodyParser.urlencoded({ extended: false }),require('./middleware/auth'),require('./router/sprint'));
app.use('/task',bodyParser.urlencoded({ extended: false }),require('./middleware/auth'),require('./router/task'));
app.use('/logout',require('./router/logout'));
app.use('/sprint',bodyParser.urlencoded({ extended: false }),require('./middleware/auth'),require('./router/sprint'));

app.listen(process.env.PORT,
    console.log(`app listen on ${process.env.PORT}`)
);
