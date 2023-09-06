var header = document.querySelector("header");
var body = document.querySelector("body");

window.addEventListener('scroll', function () {
    var scrollTop = body.scrollTop || document.documentElement.scrollTop; // Cross-browser way to get scroll position
    
    if (scrollTop > 900) {
        header.style.top = '0';
    } else {
        header.style.top = '-100px';
    }
});