
let pwCheck = [false,false,false]

$("#pw").keyup(function(){
    if($("#pw").val().length<8 || $("#pw").val().length>16){
        $("#pwMsg").text("비밀번호를 8자이상 16자이내로 입력하시오.");
    }else{
        $("#pwMsg").text("사용가능한 비밀번호");
        pwCheck[1]=true;
    }
});
$("#pw2").keyup(function(){
   if($("#pw").val()==$("#pw2").val()){
        $("#pw2Msg").text("비밀번호가 일치합니다.")
        pwCheck[2]=true;
   }else{
        $("#pw2Msg").text("일치하지 않습니다.")
   }
});

$("#pwBtn").click(function(){
     if($("#old_pw").val()==$("#old_pw").attr("data-pw")){
        pwCheck[0]=true;
        if(!pwCheck.includes(false)){
            alert("비밀번호가 변경되었습니다. 다시 로그인 해 주세요.")
            $("#pwForm").submit();
            
        }
     }else{
        alert("기존 비밀번호가 틀렸습니다. 다시 확인해주세요")
     }
})