# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<% @comment.each do |comment| %>
	<p><%= comment.commentContents %></p>
<%= link_to 'Back', comments_path %>
<%= link_to 'Edit', edit_comment_path(@comment) %>
<% end %>



 <

