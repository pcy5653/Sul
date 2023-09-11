const li = document.querySelectorAll('.fqaKind');
const ak = document.querySelectorAll('.aKind');
const list = document.getElementById("#faqList");

ak.forEach(a => {
    a.addEventListener("click", function(){
        let value = a.getAttribute("data-value");
        const href = a.getAttribute('href');
    
        //window.location.href = href;
        $.ajax({
            type:"GET",
            url:"/detail?kind="+value,
            dataType:"html",
            success:function(result){
               $("#clickKind").html(result);
            }

        })

        //console.log("value ",value);
    })
});