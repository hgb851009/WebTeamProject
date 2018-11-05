/**
 * 
 */

$(".preview").on("click", function () {
	var div_card = $(this).closest('.card');
	var card_split = div_card.attr('id').split('_');
	var path = div_card.find('img.card-img-top').attr('src');
	var type;
	if (card_split[2] == 1) {
		type = 'body';
		$("#body-id").val(card_split[1]);
	} else if (card_split[2] == 2) {
		type = 'hair';
		$("#hair-id").val(card_split[1]);
	} else if (card_split[2] == 3) {
		type = 'shirt';
		$("#shirt-id").val(card_split[1]);
	}

	$("#avatar-" + type).find('img').attr('src', path);

	$("#resetBtn").attr('disabled', null);
	$("#purchaseBtn").attr('disabled', null);
});



$(".page-link").on("click", function () {
	$(this).closest('ul').find('.active').removeClass('active');
	$(this).parent().addClass('active');
	$.ajax({
		type: "post",
		url: "itempage.do",
		datatype: "xml",
		data: {
			page: $(this).text()
		},
		success: function (data) {
			var idx = 1;
			$(data).find("item").each(function () {
				var id = $(this).find("id").text();
				var type = $(this).find('type').text();
				var tname = $(this).find('tname').text();
				var name = $(this).find("name").text();
				var detail = $(this).find("detail").text();
				var price = $(this).find("price").text();
				var path = $(this).find("path").text();

				var card = $(".col-lg-8").find('.item_' + (idx++));

				card.attr('id', 'item_' + id + '_' + type);
				card.find(".card-img-top").attr('src', path);
				card.find("h5 a").html(name);
				card.find("a.float-right").html(tname);
				card.find("h6").html(price + ' 포인트');
				card.find(".card-text").html(detail);
				card.find("div.float-right").removeClass('invisible');
				card.find("div.float-right").addClass('visible');
			})

			while (idx < 7) {
				var card = $(".col-lg-8").find('.item_' + (idx++));
				card.find(".card-img-top").attr('src', null);
				card.find("h5 a").html('');
				card.find("a.float-right").html('');
				card.find("h6").html('');
				card.find(".card-text").html('');
				card.find("div.float-right").removeClass('visible');
				card.find("div.float-right").addClass('invisible');
			}
		},
		error: function (xhr, textStatus, errorThrown) {
			alert('실패');
			
		}

	});
});