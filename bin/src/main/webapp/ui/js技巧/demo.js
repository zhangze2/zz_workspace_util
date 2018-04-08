//JS 的返回类型 typeof 操作符，不是函数  




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


//////////////////////////////////////////////////数组///////////////////////////////////////////////////   



// 创建数组的两种方法      
var colors_array = new Array(3);
var array = ["red","blue","green"];


if(Array.isArray(colors_array)){
    alert("colors_array 是数组");
}
//////////////////////////////////////////////////函数 Function///////////////////////////////////////////////////   


// 函数声明  
function sum(num1, num2){

    return num1 + num2;
}




// 函数表达式  
var f = function(sum1, sum2){
    return sum1 + sum2;
};// 注意这里的 分号  






// 没有重载 （深入理解）  
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