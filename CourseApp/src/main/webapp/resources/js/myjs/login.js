function signin(url_context) {
	
	var data = {};
	//var Form = this;
	
	
	var $inputs = $('#signinForm :input');
	
	$inputs.each(function(){
		data[this.name] = $(this).val();
		delete data["remember"];
	});
	data["remember"] = $('#chkRemember').prop("checked");
	
	$
	.ajax({
		
		type : "POST",
		url : url_context +"signin?email="+data.email+"&password=" + data.password + "&remember=" + data.remember,
		
		success : function(callback) {
			
			if (callback == 'yes') {
				location.reload();
				
			}else if(callback == 'not_confirm') {
				$('#errorDisplay').html('Tài khoản chưa được kích hoạt. Vui lòng kích hoạt trước khi đăng nhập.');
			} else if(callback == 'no') {
				$('#errorDisplay').html('Email/Password không đúng.');
			}
			
		},
		error : function(jqXHR, textStatus,
				errorThrown) {
			//alert(errorThrown);
			$('#errorDisplay').html('Error.');
			
		}
	});
}