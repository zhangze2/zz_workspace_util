//JS �ķ������� typeof �����������Ǻ���  




alert(typeof 1) ;  // Number  




var message = "some string";
alert(typeof 100) ;
alert(typeof message) ;  // String  




// Undifined   
var u_message ;
alert(u_message ==  undefind) ;  // true  


// Null  
var car = null;
alert(typeof car) ;


// Object  
alert(typeof window) ;
alert(typeof evel()) ;


//////////////////////////////////////////////////����///////////////////////////////////////////////////   



// ������������ַ���      
var colors_array = new Array(3);
var array = ["red","blue","green"];


if(Array.isArray(colors_array)){
    alert("colors_array ������");
}
//////////////////////////////////////////////////���� Function///////////////////////////////////////////////////   


// ��������  
function sum(num1, num2){

    return num1 + num2;
}




// �������ʽ  
var f = function(sum1, sum2){
    return sum1 + sum2;
};// ע������� �ֺ�  






// û������ ��������⣩  
function addSomeNumber(num){
    return num + 100;
}


function addSomeNumber(num){
    return num + 200;
}


alert(addSomeNumber(100)); // 300  


var addSomeNumber = function (num){
    return num + 100;
}


addSomeNumber = function (num){
    return num + 200;
}


alert(addSomeNumber(100));   // 300  