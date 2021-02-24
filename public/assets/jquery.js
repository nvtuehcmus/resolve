$(function() {
	$(".btn").click(function() {
		$(".form-signin").toggleClass("form-signin-left");
    $(".form-signup").toggleClass("form-signup-left");
    $(".frame").toggleClass("frame-long");
    $(".signup-inactive").toggleClass("signup-active");
    $(".signin-active").toggleClass("signin-inactive");
    $(".forgot").toggleClass("forgot-left");   
    $(this).removeClass("idle").addClass("active");
	});
});
$(()=>{
  $(".btn-signup").click(()=>{
    const email = document.getElementById('email');
    const name =  document.getElementById("fullname");
    const pass = document.getElementById('password');
    const rePass = document.getElementById('confirmpassword');
    checkPass = /^([\x2B-\x39]|[\x41-\x7A]){6,}$/
    checkMail = /^([\x2B-\x39]|[\x41-\x7A]){1,}\x40([\x2B-\x39]|[\x41-\x7A]){1,}\x2E\w{1,}$/
    if(!email || !pass||!rePass || !name){

      alert("do not leave any field blank");
      return false;
    }
    else{
      if(checkMail.test(email.value)===false || !email){
        alert("this not email")
        return false;
      }
      else if(!checkPass.test(pass.value)||!pass){
        alert("password need more than 6 character and not symbols");
        return false;
      }
      else if(pass.value != rePass.value|| ! rePass){
        alert("password is not same");
        return false;
      }

  }
  $(".nav").toggleClass("nav-up");
  $(".form-signup-left").toggleClass("form-signup-down");
  $(".success").toggleClass("success-left"); 
  $(".frame").toggleClass("frame-short");
    return true;
  })

})