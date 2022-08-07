# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rails", "~> 7.0.3"
end

require "action_controller/railtie"

class RailsApp < Rails::Application
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.secret_key_base = "SUPER-SECRET-KEY"
  config.eager_load = false
  routes.append { root "welcome#index" }
  initialize!
end

class WelcomeController < ActionController::Base
  def index
    render inline: "Hello World!"
  end
end

run Rails.application
