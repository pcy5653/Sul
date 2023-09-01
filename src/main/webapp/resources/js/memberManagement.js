

//회원삭제
for(let i=0;i<$(".btns").length;i++){
    $("#btn"+i).click(function(){
        let id=$("#memberId"+i).text();
        $.ajax({
            type:"get",
            url:"/admin/adminMemberDelete?id="+id,
            cache: false,
                success: function(result){
                    if(result.trim()==1){

                        alert("회원["+id+"]의 계정이 삭제 되었습니다.")
                        document.location.reload();
                    }
                     
              
            }
        })
    })
}

//포인트
for(let i=0;i<$(".pointBtns").length;i++){
    $("#pointBtn"+i).click(function(){
        let point=$("#point"+i).val();
        let id=$("#memberId"+i).text();
        $.ajax({
            type:"get",
            url:"/admin/pointAdd?point="+point+"&id="+id,
            success:function(result){
                if(result.trim()==1){
                    
                    alert("회원["+id+"]에게 ["+point+"]를 추가했습니다.")
                    document.location.reload();
                }
            }
        })
    })
}


//단체문자
$("#smsBtn").click(function(){
    let smsContents=$("#smsContents").val()
    for(let i=0;i<$(".smsChecks").length;i++){
        let phone = $("#phone"+i).text()
        let id = $("#id"+i).text()
        if($("#smsCheck"+i).is(':checked')){
            $.ajax({
                type:"get",
                url:"/admin/groupSMS?phone="+phone+"&smsContents="+ smsContents + "&id="+id,
                success:function(){
                    alert("단체문자를 발송했습니다.");
                }
            })
        }
        
    }    
})






