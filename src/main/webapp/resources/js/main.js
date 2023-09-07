var header = document.querySelector("header");
var hw = document.querySelector(".headerWrap")
var body = document.querySelector("body");

// header 동작
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



// best 상품(review 기준)

function best(){
    $.ajax({
        type:"GET",
        url : "/bestReview",
        dataType:'html',
        success:function(result){
             $(".bestReview").html(result);
        }
    }) 
}

//best();