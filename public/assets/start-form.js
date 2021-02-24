document.getElementById("submit").addEventListener('click', Check, false);
function add(){
    var element = document.getElementById("regis");
    element.classList.remove("login-box");
    element.classList.add("change");
}
function Check(e){
  const email = document.getElementById('email');
  const pass = document.getElementById('password');
  const rePass = document.getElementById('cpassword');
  checkPass = /^([\x2B-\x39]|[\x41-\x7A]){6,}$/
  checkMail = /^([\x2B-\x39]|[\x41-\x7A]){1,}\x40([\x2B-\x39]|[\x41-\x7A]){1,}\x2E\w{1,}$/
  if(checkMail.test(email.value)===false){
    alert("this not email")
    e.preventDefault();
    return false;
  }
  else if(!checkPass.test(pass.value)){
  alert("password need more than 6 character and not symbols");
  e.preventDefault();
  return false;
  }
  else if(pass.value != rePass.value){
  alert("password is not same")
  e.preventDefault();
  return false;
  }
  return true;
}