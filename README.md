This is Alpha, naive, itch scratching bozo code. 

Good luck.

## Install

Get the gem:

    gem install rails-async

Or add it to your gemfile:

    gem "rails-async", :require => "async"

## Setup



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

##
