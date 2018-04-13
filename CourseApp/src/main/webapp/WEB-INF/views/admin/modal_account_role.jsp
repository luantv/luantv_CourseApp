<div class="modal fade bs-example-modal-lg" id="roleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">Account roles</h4>
			</div>
			<form id="form-grant-role">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<input type="hidden" id="input-userID">
								<select multiple="multiple" size="10" id="duallistbox-roles"
									name="duallistbox_roles">
								</select>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$("#form-grant-role").submit(function(){
			var data = $('#duallistbox-roles').val();
			var userID = $('#input-userID').val();
			$.ajax({
				type: 'POST',
				url: 'grant_role?roles='+data + '&userID='+userID,
				success: function(data){
					if(data == 'done'){
						alert("Grant role: done");
						location.reload();
					}
					else if(data == 'error'){
						alert("Grant role: error");
					}
					else if(data == 'no_role'){
						window.location.href="../home.html";
					}
					else if(data == 'no_login'){
						window.location.href="../home.html";
					}
				},
				error: function(err){
					alert("Grant role: error" + err);
				}
			});
			return false;
		});
	</script>
</div>