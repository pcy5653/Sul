

for(let i=0;i<$(".btns").length;i++){
    $("#btn"+i).click(function(){
        let id=$("#memberId"+i).text();
        console.log(id)
        $.ajax({
            type:"get",
            url:"/member/adminMemberDelete?id="+id,
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
