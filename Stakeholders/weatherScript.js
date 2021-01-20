var button = document.querySelector('.button');
var inputValue = document.querySelector('.inputValue');
var name = document.querySelector('.name');
var desc = document.querySelector('.desc');
var temp = document.querySelector('.temp');




//button.addEventListener('click', function (){
//    fetch('http://api.openweathermap.org/data/2.5/weather?q='+inputValue.value+'&appid=2d62bcb7710064483cfd95ce603c11f9')
//     .then(response => response.json())
//        .then(data => console.log(data))
//    http://api.openweathermap.org/data/2.5/forecast?id=524901&appid={API key}

//.catch(err => alert(err)) //if there is an error do this
//});



button.addEventListener('click', function () {
    const proxy = 'https://cors-anywhere.herokuapp.com/';
    fetch('${proxy}https://api.openweathermap.org/data/2.5/weather?q=London&appid=2d62bcb7710064483cfd95ce603c11f9', {
        method: 'get'
    }) 
        .then(response => { response.json() })
        .then(data => { console.log(data) })
        .catch(err => alert(err))//if there is an error do this
    
});


//then(response => {

//    console.log(response)

//}