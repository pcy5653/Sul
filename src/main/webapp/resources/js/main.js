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

window.onload = function(){
    // $(document).ready(function(){
        $('#reviewBtn').click(function(){
            $.ajax({
                type:"GET",
                url : "/bestReview",
                dataType:'html',
                cache: false,
                async:false,
                success:function(result){
                        $("#reviewTotal").css("display", "block");
                        $("#reviewTotal > #review_del").css("display", "block");
                        $("#review_fixed").html(result);
                        $("#review_fixed > .headerWrap").css("display", "none");
                        $("#review_fixed > .viewport").css("display", "none");
                        $("#review_fixed > #outerWrap").css("margin", "0 auto");
                        $("#review_fixed > #outerWrap").css("height", "100%");
                        $("#review_fixed > #outerWrap").css("z-index", "2");
                        $("#review_fixed > #outerWrap > #top").css("display", "none");
                        $("#review_fixed > #outerWrap > .line").css("display", "none");
                        $("#review_fixed > #outerWrap > #navWrap").css("display", "none");
                        $("#review_fixed > #outerWrap > #productList").css("display", "flex");
                        $("#review_fixed > #outerWrap > #productList").css("align-items", "center");
                        $("#review_fixed > #outerWrap > #productList").css("height", "100%");
                        $("#review_fixed > #outerWrap > #productList").css("margin", "0");
                    }
            }) 
        });
    // });
}


$("#review_del").click(function(){
    $("#reviewTotal").css("display", "none");
    $("#reviewTotal > #review_del").css("display", "none");
})
