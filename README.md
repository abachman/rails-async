A Rails engine that provides a view helper that will speed your page loads. See the bottom of the README for the example use, that will probably make more sense than me explaining it here.

This is Alpha, naive, itch scratching bozo code. 

Good luck.

## Install

Get the gem:

    gem install rails-async

Or add it to your gemfile:

    gem "rails-async", :require => "async"

## Setup

Add the helper method to you application_controller:

    helper :async

That's it.

## Use

Slow page:

    <h1>Accounts</h1>
    <ul>
      <% sleep 3.8 %>
      <% @accounts.each do |account| %>
        <li>
          <%= render 'account', :account => account %>
        </li>
      <% end %>
    </ul>

Fast page:

    <h1>Accounts</h1>
    <ul>
      <% asynchronously do %>
        <% sleep 3.8 %>
        <% @accounts.each do |account| %>
          <li>
            <%= render 'account', :account => account %>
          </li>
        <% end %>
      <% end %>
    </ul>

Async worries about responding, you worry about why your code is so slow.

## Unanswered Questions

Scale: how big can it get if we're forking *n* times for every request?

Speed: at what point is an approach like this worse than just rendering the whole page at once? Gotta measure to know if you're improved anything.
