NUS REVIEW CODE BY GIAUNV 9.9.2020
----------------------

1. `./app/controllers/albums_controller.rb`

```
@new_title = params[:album][:title]
@album.title = @new_title
if @album.update(album_params)
--> duplicate, should remove
  @new_title = params[:album][:title]
  @album.title = @new_title
```

2. `./app/controllers/photos_controller.rb`

```
@photo = Photo.create(user_params)
if @photo.save
--> duplicate, should remove one of .save, .create
```

3. `./app/controllers/users_controller.rb`

```
      @following_photos += Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public")
--> Using association instead of Array +=
```

4. `./app/views/albums/edit.html.erb`

```
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Google Roboto Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- add after bootstrap.min.css -->
    <link rel="stylesheet" href="https://cdn.rawgit.com/afeld/bootstrap-toc/v0.3.0/dist/bootstrap-toc.min.css">
    <%= stylesheet_link_tag 'style' %>


    <title>Albums</title>
  </head>
  <body class="ft-mainpage">

      ...

      <!-- Font Awesome -->
      <script src="https://kit.fontawesome.com/1fb1fb2be8.js" crossorigin="anonymous"></script>

      <!-- Optional JavaScript -->

      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

      <%# JQuery Validate %>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.js"></script>

      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
      <!-- add after bootstrap.min.js -->
      <script src="https://cdn.rawgit.com/afeld/bootstrap-toc/v0.3.0/dist/bootstrap-toc.min.js"></script>

      <%# <script src="src.js"></script> %>
      <%= javascript_include_tag 'src' %>
    </body>
</html>

--> Should be moved to layout
```


Please fix above issues and the same places
