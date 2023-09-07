var header = document.querySelector("header");
var hw = document.querySelector(".headerWrap")
var body = document.querySelector("body");

window.addEventListener('scroll', function () {
    var scrollTop = body.scrollTop || document.documentElement.scrollTop; // Cross-browser way to get scroll position
    
    if (scrollTop > 900) {
        hw.style.top = '0';
        header.style.top = '0';
    } else {
        hw.style.top = '-100px';
        header.style.top = '-100px';
    }
});