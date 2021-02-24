const nodemailer = require ('nodemailer');
const dotenv =  require('dotenv');
dotenv.config();
async function send(to,subject,content){
const transporter =nodemailer.createTransport({
    service: 'hotmail',
    auth:{
        user:process.env.USER_NAME,
        pass:process.env.PASSWORD
    }
});



return transporter.sendMail({
    from :process.env.USER_NAME,
    to,
    subject,
    html:content,
}).then(console.log).catch(console.error);
}
module.exports ={send};