$("#infoBtn").click(function(){
    
    fetch("info",{
        method:"get"
    })
    .then((response)=> response.text())
    .then((r)=>
        $("#page").html(r)
    )
})
//jquery로하면 오류뜸 추가할때 fetch로 추가

$(document).on("click","#updateBtn",function(){
    $("#myForm").submit();
    alert("회원정보가 수정되었습니다.")
})



let pwCheck = [false,false,false]

$(document).on("keyup","#pw",function(){
    if($("#pw").val().length<8 || $("#pw").val().length>16){
        $("#pwMsg").text("비밀번호를 8자이상 16자이내로 입력하시오.");
    }else{
        $("#pwMsg").text("사용가능한 비밀번호");
        pwCheck[1]=true;
    }
})

$(document).on("keyup","#pw2",function(){
    if($("#pw").val()==$("#pw2").val()){
        $("#pw2Msg").text("비밀번호가 일치합니다.")
        pwCheck[2]=true;
   }else{
        $("#pw2Msg").text("일치하지 않습니다.")
   }
})

$(document).on("click","#pwBtn",function(){
    if($("#old_pw").val()==$("#old_pw").attr("data-pw")){
        pwCheck[0]=true;
        if(!pwCheck.includes(false)){
            alert("비밀번호가 변경되었습니다. 다시 로그인 해 주세요.")
            $("#pwForm").submit();
        }else{
            alert("빈칸을 채워주세요")
        }
     }else{
        if($("#old_pw").val().length>0){
            alert("기존 비밀번호가 틀렸습니다. 다시 확인해주세요")
        }else{
            alert("빈칸을 채워주세요")
        }
     }
})

$(document).on("click","#delBtn",function(){
    alert("회원탈퇴 되었습니다.");
    location.href="/member/deleteMember";
})
