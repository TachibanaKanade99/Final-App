$(document).ready(function() {
	var form = $(".form-signin");
	form.validate({
		rules: {
			"user[first_name]": {
				required: true
			},
            "user[last_name]": {
                required: true
            },
            "user[email]": {
                required: true
            },
            "user[password]": {
                required: true
            },
            "user[password_confirmation]": {
                required: true
            },
		},
		messages: {
			"user[first_name]": {
                required: "First Name cannot be empty"
            },
            "user[last_name]": {
                required: "Last Name cannot be empty"
            },
            "user[email]": {
                required: "Email cannot be empty"
            },
            "user[password]": {
                required: "Password cannot be empty"
            },
            "user[password_confirmation]": {
                required: "Reenter your password!!!",
                equalTo: "Your password is not the same!"
            },
		},
		// errorPlacement: function(error, element){
		// 	error.appendTo($(element).next())
		// }
	});

    //Photo Modal
    $(".card-img").bind("click", function (){
        title = $(this).parent().children("div.col-md-6").children("div.card-title").children("p").children("strong");
        // console.log(title.text());
        src = $(this).attr("src")
        description = $(this).parent().children("div.col-md-6").children("div.card-body").children("p.card-text");
        // console.log(description.text());
        created_at = $(this).parent().children("div.col-md-6").children("span.ft-date");
        // console.log(created_at.text());

        $(".modal-title").text(title.text());
        $(".modal-body").children("p").text(description.text());
        $(".modal-body").children("img").attr("src", src);
        $(".modal-footer").children("p").text(created_at.text());
        $("#photo-modal").modal("show");
    });

    //Album Modal
    $(".album-imgs").bind("click", function (){
        title = $(this).parent().parent().children("div.pl-4").children("div.card-title").children("p").children("strong");
        // console.log(title.text());
        src = $(this).attr("src")
        description = $(this).parent().parent().children("div.col-md-6").children("div.card-body").children("p.card-text");
        // console.log(description.text());
        created_at = $(this).parent().parent().children("div.col-md-6").children("span.ft-date");
        // console.log(created_at.text());

        $(".modal-title").text(title.text());
        $(".modal-body").children("p").text(description.text());
        $(".modal-body").children("img").attr("src", src);
        $(".modal-footer").children("p").text(created_at.text());
        $("#photo-modal").modal("show");
    });

    // Album and Photo Button
    selected_btn = $(".btn-group").children("button")
    selected_btn.on({
        click: function () {
            $(this).addClass("active");
            console.log($(this).text());
            console.log(selected_btn.not(this));
            if (selected_btn.not(this).hasClass("active")) {
                selected_btn.not(this).removeClass("active");
            }
        }
    });

    // Feed - Discovery Button
    selected_btn = $(".sticky-top").children().children("button.btn")
    // console.log(selected_btn.text())
    selected_btn.on({
        click: function () {
            $(this).addClass("content-text-active")
            // console.log($(this).text())
            // console.log($(selected_btn).not(this).text())
            if (selected_btn.not(this).hasClass("content-text-active")) {
                selected_btn.not(this).removeClass("content-text-active")
            }
        }
    });

    // Image Preview

});