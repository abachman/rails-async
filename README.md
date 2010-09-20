This is Alpha, naive, itch scratching bozo code. I've reinvented Rails
fragment caching, poorly, because I can.

Don't reinvent the wheel. Always reinvent the wheel.

Ponder this, good luck.

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
