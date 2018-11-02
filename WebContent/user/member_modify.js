
//아이디 중복유무
function admin_modify_member(userID) {
    $.ajax({
        type: 'POST',
        url: '/getUserInfo',
        data: {userID: userID},
        dataType: 'json',
        success: function (data) {
            // alert(data);
            $('#userIDModal').val(data.userID);
            $('#userNameModal').val(data.userName);
            $('#userNickNameModal').val(data.userNickName);
            $('#userPwdModal').val(data.userPwd);
            $('#userLevelModal').val(data.userLevel);
        }
    })
}
//탈퇴
function admin_delete_member(userID) {
    var deleteUser = confirm("회원 정보를 삭제하시겠습니까?\n삭제한 회원은 복구할 수 없습니다.");
    if (deleteUser == true) {
        $.ajax({
            type: 'POST',
            url: '/deleteUserInfo',
            data: {userID: userID},
            success: function (result) {
                if(result == 1){
                    alert("회원정보가 삭제되었습니다.")
                    location.reload();
                } else {
                    alert("데이터베이스 오류")
                }
            }
        })
    }
}
//회원정보변경
function admin_modify_submit() {
    var userID = $('#userIDModal').val();
    var userNickName = $('#userNickNameModal').val();
    var userPwd = $('#userPwdModal').val();
    var userLevel = $('#userLevelModal option:checked').val();
    $.ajax({
        type: 'POST',
        url: '/userInfoModify',
        data: {userID: userID, userNickName: userNickName, userPwd: userPwd, userLevel: userLevel},
        success: function (result) {
            if (result == 1) {
                alert("수정완료");
                location.reload();
            } else {
                alert("수정실패")
            }
        }
    })
}