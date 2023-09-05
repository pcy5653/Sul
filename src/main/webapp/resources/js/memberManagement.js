
$("#allCheckBtn").click(function(){
    if($(".smsChecks").prop("checked")){
        $(".smsChecks").prop("checked",false);
    }else{

        $(".smsChecks").prop("checked",true);
    }
})
$("#allCheckBtn2").click(function(){
    if($(".memberChecks").prop("checked")){
        $(".memberChecks").prop("checked",false);
    }else{
        $(".memberChecks").prop("checked",true);
    }
})

//선택한 회원삭제
$("#deleteBtn").click(function () {
    let deleteMember = '';
    let count = 0;
    for (let i = 0; i < $(".memberChecks").length; i++) {
        if ($("#memberCheck" + i).is(':checked')) {
            let id = $("#memberId" + i).text();

            $.ajax({
                type: "get",
                url: "/admin/adminMemberDelete?id=" + id,
                success: function () {

                    document.location.reload();
                }
            })
            deleteMember = deleteMember + id + ';' 
            count = count + 1;
        }
        
    }
    alert("["+deleteMember + "] " +  count + "명의 계정을 삭제했습니다.")
    
})

//선택한 회원 포인트지급
$("#pointBtn").click(function () {
    let point = $("#point").val();
    let count = 0;
    let pointMember = '';
    for (let i = 0; i < $(".memberChecks").length; i++) {
        if ($("#memberCheck" + i).is(':checked')) {
            let id = $("#memberId" + i).text();

            $.ajax({
                type: "get",
                url: "/admin/pointAdd?point=" + point + "&id=" + id,
                success: function () {
                    document.location.reload();
                }
            })
            pointMember = pointMember + id + ';'
            count= count +1;
        }
        
    }
    
    alert("회원["+ pointMember + "] " + count +"명에게 [" + point + "] 포인트를 지급했습니다.")
    
})


//단체문자
$("#smsBtn").click(function () {
    let smsContents = $("#smsContents").val()
    for (let i = 0; i < $(".smsChecks").length; i++) {
        let phone = $("#phone" + i).text()
        //체크된사람만 전송
        if ($("#smsCheck" + i).is(':checked')) {
            $.ajax({
                type: "get",
                url: "/admin/groupSMS?phone=" + phone + "&smsContents=" + smsContents,
                success: function () {

                }
            })
        }

    }
    alert("단체문자를 발송했습니다.");
})

$("#searchBtn").click(function(){
    let id = "."+$("#search").val();
    let check = "#memberCheck"+$(id).attr("id").substr("8");
    if(!$(check).is(':checked')){
        $(check).prop("checked",true);
        alert("회원["+$("#search").val()+"]이 선택 되었습니다.")
    }else{
        $(check).prop("checked",false);
        alert("회원["+$("#search").val()+"]이 선택 해제 되었습니다.")
    }
})

$("#searchBtn2").click(function(){
    let id = "."+$("#search2").val()+"two";
    let check = "#smsCheck"+$(id).attr("id").substr("11")
    if(!$(check).is(':checked')){
        $(check).prop("checked",true);
        alert("회원["+$("#search2").val()+"]이 선택 되었습니다.")
    }else{
        $(check).prop("checked",false);
        alert("회원["+$("#search2").val()+"]이 선택 해제 되었습니다.")
    }
})





