

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
        let id = $("#id" + i).text()
        //체크된사람만 전송
        if ($("#smsCheck" + i).is(':checked')) {
            $.ajax({
                type: "get",
                url: "/admin/groupSMS?phone=" + phone + "&smsContents=" + smsContents + "&id=" + id,
                success: function () {
                    alert("단체문자를 발송했습니다.");
                }
            })
        }

    }
})






