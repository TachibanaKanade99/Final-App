$(document).on('ready turbolinks:load', function() {
	var form = $(".form-signin, .photo-form, .album-form");
	form.validate({
		rules: {
            // User
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

            // Photo
            "photo[title]": {
                required: true
            },

            "photo[image]": {
                required: true
            },

            // Album
            "album[title]": {
                required: true
            },
		},
		messages: {
            // User
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

            // Photo
            "photo[title]": {
                required: "Photo Title cannot be empty"
            },

            "photo[image]": {
                required: "Photo Image cannot be empty"
            },

            // Album
            "album[title]": {
                required: "Album Title cannot be empty"
            },

		},
		// errorPlacement: function(error, element){
		// 	error.appendTo($(element).next())
		// }
    });
    
    // Files Btn
    $(".change-btn.btn-secondary").change(function() {
        filename = this.files[0].name
        console.log(filename);
    });

    //Photo Modal
    $(".card-img").bind("click", function (){
        title = $(this).parent().children("div.col-md-6").children("div.card-title").children("p").children("strong");
        // console.log(title.text());
        src = $(this).attr("src")
        description = $(this).parent().children("div.col-md-6").children("div.card-body").children("p.card-text");
        // console.log(description.text());
        created_at = $(this).parent().children("div.col-md-6").children("div.card-foot").children("div.ft-date");
        // console.log(created_at.text());

        $(".modal-title").text(title.text());
        $(".modal-body").children("p").text(description.text());
        $(".modal-body").children("img").attr("src", src);
        $(".modal-footer").children("p").text(created_at.text());
        $("#photo-modal").modal("show");
    });

    //Album Modal
    // $(".album-imgs").bind("click", function (){
    //     title = $(this).parent().parent().children("div.pl-4").children("div.card-title").children("p").children("strong");
    //     // console.log(title.text());
    //     src = $(this).attr("src")
    //     description = $(this).parent().parent().children("div.col-md-6").children("div.card-body").children("p.card-text");
    //     // console.log(description.text());
    //     created_at = $(this).parent().parent().children("div.col-md-6").children("span.ft-date");
    //     // console.log(created_at.text());

    //     $(".modal-title").text(title.text());
    //     $(".modal-body").children("p").text(description.text());
    //     $(".modal-body").children().children("div.carousel-inner").children("div.active").children("img").attr("src", src);
    //     $(".modal-footer").children("p").text(created_at.text());
    //     $("#albums-modal").modal("show");
    // });

    // // Album and Photo Button
    // selected_btn = $(".btn-group").children()
    // selected_btn.on({
    //     click: function () {
    //         $(this).addClass("active");
    //         console.log($(this).text());
    //         console.log(selected_btn.not(this).text());
    //         if (selected_btn.not(this).hasClass("active")) {
    //             selected_btn.not(this).removeClass("active");
    //         }
    //     }
    // });

    // Feed - Discovery Button
    // selected_btn = $(".sticky-top").children().children("button.btn")
    // // console.log(selected_btn.text())
    // selected_btn.on({
    //     click: function () {
    //         $(this).addClass("content-text-active")
    //         // console.log($(this).text())
    //         // console.log($(selected_btn).not(this).text())
    //         if (selected_btn.not(this).hasClass("content-text-active")) {
    //             selected_btn.not(this).removeClass("content-text-active")
    //         }
    //     }
    // });

    // Image Preview
    $(".file-input").change(function(){
		readURL(this);
	});
	$(".close-btn").on("click", function() {
		$(".image-preview").addClass("d-none");
		$(".image").removeClass("d-none");
    });
    
    // $(".images-preview .col-md-12 .close-btn").on("click", function() {
    //     console.log($(this).text())
    //     // $(this).parent().parent().addClass("d-none");
    // });

    // Bootstrap Tabs
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = localStorage.getItem('activeTab');
    if(activeTab){
        $('#myTab a[href="' + activeTab + '"]').tab('show');
    }
});

function readURL(input) {
	if (input.files && input.files[0]) {
		  var reader = new FileReader();
	  
		reader.onload = function(e) {
			$(".img-preview").attr("src", e.target.result);
			$(".image").addClass("d-none");
			$(".image-preview").removeClass("d-none");
		}
		
		reader.readAsDataURL(input.files[0]); // convert to base64 string
	}
}
