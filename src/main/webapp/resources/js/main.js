// header

let body = document.querySelector('html, body');
let header = document.querySelector('header')

window.addEventListener('scroll',function(){
    if(body.scrollTop > 200){
        header.style.top = '0'
    }else{
        header.style.top = '-100px'
    }
})