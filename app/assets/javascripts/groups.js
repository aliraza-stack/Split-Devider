$( function() {
	$("#cal-submit").click(function(){
		total_price = $('#total_price').text()
		people = $("#people").val()
		result = total_price/people
		$('#show_result').text(result)
	});
});
