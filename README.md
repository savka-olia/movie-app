<h1 class="headings text-center mt-4 py-2">Movies</h1>
<div class="container">
  <% @movies.each do |movie| %>
    <div class="cards">
      <div class="index_img">
         <%= image_tag(movie.image) %>
      </div>
      <div class="index_text">
          <h4><%= movie.title %></h4>
          <hr />
          <div class="index_btn">
            <%= link_to "Show", movie_path(movie), class: "form_btn" %>
          </div>
      </div>
    </div>
  <% end %>
  <div class="flickr_pagination">
    <%= will_paginate @movies, :container => false %>
  </div>
</div>
-------------
<nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="#">Movie App</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          Movies
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <%= link_to "View Movies List", movies_path, class: "dropdown-item" %>
          <% if current_user && current_user.admin? %>
            <div class="dropdown-divider"></div>
              <%= link_to "Create new Movie", new_movie_path, class: "dropdown-item" %>
            </div>
          <% end %>
      </li>
      <% if current_user %>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <%# view profile add %>
          <%= link_to "Edit profile", edit_user_registration_path, class: "dropdown-item" %>
          <div class="dropdown-divider"></div>
          <%= link_to "Log Out", destroy_user_session_path, method: :delete, class: "dropdown-item" %>
        </div>
      </li>
      <% else %>
        <li class="nav-item">
          <%= link_to "Sign up", new_user_registration_path, class: "nav-link" %>
        </li>
        <li class="nav-item">
          <%= link_to "Log In", user_session_path, class: "nav-link" %>
        </li>
      <% end %>
    </ul>
  </div>
</nav>