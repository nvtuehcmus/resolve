function format(element){
    var amount = element.value;
    if(amount.length>3){

    amount = amount.split(',');
    var balance = "";
    amount.map(element=>balance+=element);

    element.value = new Intl.NumberFormat().format(balance)
    }
  }