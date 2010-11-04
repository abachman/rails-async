class StartController < ApplicationController
  before_filter :load_accounts

  def slow
  end

  def fast
  end

  def fast_multi
  end

  def index
  end

  def load_accounts
    @accounts = ["Adam", "Bill", "Charlie", "Dave"]
  end
end
