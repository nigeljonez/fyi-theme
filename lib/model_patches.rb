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
      write_attribute(:url_title, self.calculate_url_title)
    end

    def calculate_url_title
      "#{self.id}-#{self.title.parameterize}"
    end

    def title=(title)
      write_attribute(:title, title)
      if self.new_record?
        self.url_title = self.title.parameterize
      elsif title != self.url_title
        self.update_attribute(:url_title, self.calculate_url_title)
      end
    end
  end
end
