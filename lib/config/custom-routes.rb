# -*- encoding : utf-8 -*-
# Here you can override or add to the pages in the core website

Rails.application.routes.draw do
  # brand new controller example
  # get '/mycontroller' => 'general#mycontroller'
  # Additional help page example
  # get '/help/help_out' => 'help#help_out'
  match "/help" => redirect("https://meta.fyi.org.nz/help"), :via => :get
  match "/help/about" => redirect("https://meta.fyi.org.nz/help/about"), :as => :help_about_new, :via => :get
  match "/help/general" => redirect("https://meta.fyi.org.nz/help/about"), :as => :help_gen, :via => :get
  match "/help/requesting" => redirect("https://meta.fyi.org.nz/help/making-requests"), :as => :help_requesting_new, :via => :get
end
