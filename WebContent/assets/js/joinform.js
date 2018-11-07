/**
 * 
 */
$(function() {
	$("#signup-form").validate({
		rules : {
			userid : {
				required : true,
				validId : true,
				remote : {
					url : "checkIdEmail.do",
					type : "post",
					data : {
						userid : function() {
							return $("#userid").val();
						}
					}
				}
			},
			password : {
				required : true,
				validPwd : true
			},
			confirm_password : {
				required : true,
				validPwd : true,
				equalTo : "#password"
			},
			usernick : {
				required : true,
				minlength : 2
			},
			username : {
				required : true,
				minlength : 2
			},
			gender : {
				required : true,
				minlength : 1
			},
			useremail : {
				required : true,
				validEmail : true,
				remote : {
					url : "checkIdEmail.do",
					type : "post",
					data : {
						email: function() {
							return $("#useremail").val();
						}
					}
				}
			}
		},
		messages : {
			userid : {
				required : "필수 정보입니다.",
				remote : "이미 사용 중인 아이디입니다."
			},
			password : {
				required : "필수 정보입니다."
			},
			confirm_password : {
				required : "필수 정보입니다.",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			usernick : {
				required : "필수 정보입니다.",
				minlength : "최소 2자리 이상입니다."
			},
			username : {
				required : "필수 정보입니다.",
				minlength : "최소 2자리 이상입니다."
			},
			useremail : {
				required : "필수 정보입니다.",
				remote : "이미 사용 중인 이메일입니다."
			},
			gender : "성별을 체크하세요"
		},
		showErrors : function(errorMap, errorList) {
			$.each(this.successList, function(index, value) {
				$(value).removeClass("is-invalid");
				$(value).addClass("is-valid");
				return $(value).popover("hide");
			});
			return $.each(errorList, function(index, value) {
				var _popover = $(value.element).popover({
					trigger : "manual",
					placement : "right",
					content : value.message
				});

				
				_popover.attr("data-content", value.message);
				$(value.element).removeClass("is-valid");
				$(value.element).addClass("is-invalid");
				return $(value.element).popover("show");
			});
		}
	});
});

$.validator.addMethod("validId", function(value) {
	// 아이디는 6~12자리, 영대소문자 포함, 숫자 포함
	var regId = /^(?=.*[A-Za-z])[A-Za-z\d]{5,20}$/;
	return regId.test(value);
}, "5~20자의 영문자, 숫자만 사용 가능합니다.");

$.validator.addMethod("validPwd",function(value) {
	// 비밀번호는 8~15자리, 영대소문자 포함, 숫자 포함
	var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{6,20}$/;
	return regPwd.test(value);
}, "8~20자의 영문자, 숫자, 특수문자를 사용하세요.");


$.validator.addMethod("validEmail",function(value) {
	var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return regEmail.test(value);
}, "이메일 주소를 다시 확인해 주세요.");
