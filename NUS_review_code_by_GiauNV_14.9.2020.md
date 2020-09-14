NUS REVIEW CODE BY GIAUNV 14.9.2020
----------------------

### The issues have not been fixed yet

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

### New issues

1. `./app/controllers/albums_controller.rb`

```
        updated = @album.update!(title: params[:album][:title],
                                sharing_mode: params[:album][:sharing_mode],
                                description: params[:album][:description],
                                images: @album.images + params[:album][:images]
                                )
--> Using strong parameter https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
```

2. `./app/controllers/users_controller.rb`

```
    @following_photos = @following_users.map{ |user| Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public") }.flatten!
    ...
    @following_albums = @following_users.map{ |user| Album.joins(:user).where("albums.user_id = ? AND albums.sharing_mode = ?", user.id, "public") }.flatten!
--> Using association instead
```

Please fix above issues and the same places
