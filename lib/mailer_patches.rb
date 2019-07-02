# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  # Override mailer templates with theme ones. Note doing this in a before_filter,
  # as we do with the controller paths, doesn't seem to have any effect when
  # running in production

  OutgoingMailer.class_eval do
    alias_method :orig_initial_request, :initial_request
    alias_method :orig_followup, :followup

    def initial_request(info_request, outgoing_message)
      headers["X-SES-CONFIGURATION-SET"] = ENV['AWS_SES_AGENCY_CFSET'] || 'alaveteli-agency'
      orig_initial_request(info_request, outgoing_message)
    end

    def followup(info_request, outgoing_message, incoming_message_followup)
      headers["X-SES-CONFIGURATION-SET"] = ENV['AWS_SES_AGENCY_CFSET'] || 'alaveteli-agency'
      orig_followup(info_request, outgoing_message, incoming_message_followup)
    end
  end
end
