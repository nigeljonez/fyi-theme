# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  # better URLs

  InfoRequest.class_eval do
    def update_url_title
      write_attribute(:url_title, calculate_url_title)
    end

    def calculate_url_title
      "#{id}-#{title.parameterize}"
    end

    def title=(title)
      write_attribute(:title, title)
      if new_record?
        url_title = title.parameterize
      elsif title != url_title
        write_attribute(:url_title, calculate_url_title)
      end
    end
  end
end
