

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


