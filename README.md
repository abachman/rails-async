A Rails engine that provides a view helper that will speed your page loads. See
the bottom of the README for the example use, that will probably make more sense
than me explaining it here.

This is Alpha, naive, itch scratching bozo code.

Don't reinvent the wheel. Always reinvent the wheel.

Ponder this, good luck.

## Install

Add it to your gemfile:

    gem "rails-async", :require => "async"

## Setup

Add the following to your `app/controllers/application\_controller.rb`:

    class ApplicationController < ActionController::Base
      helper :async
      after_filter do
        Thread.new { AsyncCache.instance.build }
      end

      # ...
    end

That's it. If you don't want it available on every request, add it to the
specific controllers where you intend to use it.

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

**Speed**: at what point is an approach like this worse than just rendering the
whole page at once? Gotta measure to know if you're improved anything.

**Practicality of testing**: what's the mimimum viable test rig?

**Praticality in general**: who's gonna use it? When would this be more useful
than manual ajax / async page splitting?
