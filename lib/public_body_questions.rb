# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  # Default questions
  default = PublicBody.internal_admin_body
  default_pi_deny = _(
    <<-HTML.strip_heredoc.squish
      <p>
        Requests made using FYI.org.nz are designed to be <strong>public</strong>,
        as a result anybody around the world can view your request and the
        response you would receive. For this reason we do not allow requests
        regarding private information, either about yourself or another person,
        unless there are potential public interest grounds.

        Many agencies will direct you to discuss such requests outside of the
        FYI.org.nz website. As a result we urge you to consider using the 
        Privacy Commissioner's <a href="https://www.privacy.org.nz/further-resources/aboutme-request-my-info-tool/">About Me</a>
        tool instead.
      </p>
    HTML
  )

  PublicBodyQuestion.build(
    public_body: default,
    key: :private,
    question: _('about myself, or another person.'),
    response: default_pi_deny
  )

  PublicBodyQuestion.build(
    public_body: default,
    key: :oia,
    question: _('about information held in an official capacity.'),
    response: :allow
  )
end
