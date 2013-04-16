# This file is executed in the Rails evironment by the `rails-post-install` script

PublicBody.each{|body|
    body.translations.each{|translation|
        translation.update_attribute(:locale, "en") if translation.locale == "en_NZ"
    }
}
