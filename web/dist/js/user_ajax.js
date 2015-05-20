
$(document).ready(function () {

	/* View Profile */
	$("#view_profile").click(function (e) {
		e.preventDefault();

		//No post data. Just get info in the session in the Controller

		$.get("UserController?p=viewProfile", function (response) {
			$("#content").html(response);
		});
	});

	//mass search button
	$("#mass_search").submit(function (e) {
		e.preventDefault();
		var postData = {
			parish: $("#mass-parish").val(),
			address: $("#mass-address").val(),
			day: $("#mass-day").val(),
			time: $("#mass-time").val(),
			language: $('input[name="mass-language"]:checked').val()
		};

		$.post("<?= base_url('index.php/services/get_mass_view') ?>", postData, function (response) {
			$("#mass-search-content").html(response);
			$('#table_id').dataTable();
		});
	});
});