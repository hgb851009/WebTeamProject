//아이디에 대문자가 있을경우 소문자로 변환
function fnKeyUp(objId){
    var $obj = $('#'+objId);
    var this_val = $obj.val();
    var regExp = /(?=.*[A-Z])/;

    if(regExp.test(this_val)){
        $obj.val(this_val.toLowerCase());
    }
}

// 아이디 중복조회
function registerCheckFunction() {
    var userID = $('#userID').val();
    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (!userID) {
        $('#userID').focus();
        $('#checkMessage').html('<p class="text-danger" style="margin: 0px !important; height: 0px"><i class="fa fa-exclamation-triangle"></i>이메일주소를 입력해주세요.<p>');
        return false;
    }
    if (!regEmail.test(userID)) {
        $('#userID').focus();
        $('#checkMessage').html('<p class="text-danger" style="margin: 0px !important; height: 0px"><i class="fa fa-exclamation-triangle"></i>이메일주소가 유효하지않습니다.<p>');
        return false;
    }
    $.ajax({
        type: 'POST',
        url: '/userRegisterCheck',
        data: {userID: userID},
        success: function (result) {
            if (result == 1) {
                $('#checkMessage').html('<p class="text-primary" style="margin: 0px !important; height: 0px"><i class="fa fa-check"></i>사용할 수 있는 아이디입니다.<p>')
            } else {
                $('#checkMessage').html('<p class="text-danger" style="margin: 0px !important; height: 0px"><i class="fa fa-exclamation-triangle"></i>사용할 수 없는 아이디입니다.<p>')
            }
        }
    })
}
function passwordCheckfunction() {
    var userPassword1 = $('#userPwd').val();
    var userPassword2 = $('#userPwd2').val();
    if (userPassword1 != userPassword2) {
        $('#passwordCheckMessage').html('<p class="text-danger" style="margin: 0px !important; height: 0px"><i class="fa fa-exclamation-triangle"></i>비밀번호가 서로 일치하지 않습니다.<p>');
    } else {
        $('#passwordCheckMessage').html('');
    }
}