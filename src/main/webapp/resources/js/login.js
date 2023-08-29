
$("#btn").click(function(){
    $.ajax({
        type:"POST",
        url:"/member/login",
        data:{
            id:$("#id").val(),
            pw:$("#pw").val()
        },
        success:function(result){
            if(result.trim()==0){
                alert("아이디 또는 비밀번호가 틀렸습니다.");
            }else{
                $("#loginFrm").submit();
            }
        }
    })
})