let phone= $("#btn2").attr("data-phone") ;
let id= $("#btn2").attr("data-id");
$("#btn1").click(function(){
    $("#findform").submit();
    
})

$("#btn2").click(function(){
    $.ajax({
        type:"get",
        url:"phonePw?phone="+phone+"&id="+id,
        cache: false,
                success: function (result) {
                    if(result.trim()==1){
                        alert("임시비밀번호가 문자로 전송되었습니다.\n 임시비밀번호로 로그인 후 비밀번호를 변경해주세요.")
                        window.close();
                    }
                }
    })
})