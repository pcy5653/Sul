/*
	이전 페이지 URL(document.referrer)을 확인하여 URL에 order이 포함되어 있다면,
	즉 order 페이지에서 기본 배송지 수정 버튼을 눌러서 온 것이라면 회원정보 버튼을 trigger
*/
$(function(){
	if(document.referrer.indexOf("order") != -1){
		$("#infoBtn").trigger("click");
	}
})
                
// 주문 내역
$("#orderListBtn").click(function(){
	$("body").append("<div id='loading'></div>");
	
	$.ajax({
        type:"get",
        url:"../order/list",
        dataType:'html',
        success:function(data){
            $("#more").html("");
            $("#before").html("");
            $("#page").html(data);
            $("#loading").remove();
        }
    })
});

// //1:1문의
// $("#qnaBtn").click(function(){
//     $.ajax({
//         type:"get",
//         url:"/qna/list",
//         dataType:'html',
//         success:function(data){
//             $("#page").html(data)
//         }
//     })
// })

//회원정보
$("#infoBtn").click(function(){
    $.ajax({
        type:"get",
        url:"/member/info",
        dataType:'html',
        success:function(data){
            $("#more").html("");
            $("#before").html("");
            $("#page").html(data)
        }
    })
})
let totalPage = 0;
let pageNum=1;
//작성리뷰//////////////////////////////////////////////////////////////////////
$("#reviewBtn").click(function(){
    
    pageNum=1;
    $("#before").html("")
    $.ajax({
        type:"get",
        url:"/product/myReviewList",
        data:{
            page:pageNum
        },
        success:function(data){
            $("#page").html(data);
            totalPage = $('#outerWrap').attr('data-totalPage')
            let btn5 = '<button id="moreButton" class="btn btn-success">다음5개('+pageNum+'/'+totalPage+')</button>';
            let btn4 = '<button id="lastButton" class="btn btn-danger">마지막페이지('+pageNum+'/'+totalPage+')</button>';
            if(pageNum<totalPage){
                $('#more').html(btn5);
            }else{
                $('#more').html(btn4);
            }
        }
    })
})
function myReviewList(page){
    $.ajax({
        type:"get",
        url:"/product/myReviewList",
        data:{
            page:page
        },
        success:function(data){
            $("#page").html(data);
            totalPage = $('#outerWrap').attr('data-totalPage')
            let btn5 = '<button id="moreButton" class="btn btn-success">다음5개('+pageNum+'/'+totalPage+')</button>';
            let btn4 = '<button id="lastButton" class="btn btn-danger">마지막페이지('+pageNum+'/'+totalPage+')</button>';
            let btn3 = '<button id="beforeButton" class="btn btn-warning">이전5개('+pageNum+'/'+totalPage+')</button>';
            if(pageNum<totalPage){
                $('#more').html(btn5);
            }else{
                $('#more').html(btn4);
            }
            if(pageNum!=1){
                $('#before').html(btn3);
            }else{
                $('#before').html("");
            }
        }
    })
}

$("#before").on("click","#beforeButton",function(){
    pageNum--;
    myReviewList(pageNum)
})

$("#more").on("click","#moreButton",function(){
    if(pageNum>=totalPage){
        return
    }
    pageNum++;
    myReviewList(pageNum)
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).on("click","#updateBtn",function(){
    $.ajax({
        type:"post",
        url:"updateInfo",
        data:{
            phone: $('#phone').val(),
            id:$('#id').val(),
            address:$('#address').val(),
            birth:$('#birth').val()
        }
    })
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

