require 'devise_traceable/hooks/traceable'

module Devise
  module Models
    module Traceable
      def stamp!
        new_current = Time.now

        "#{self.class}Tracing".constantize.create(
          ip: self.current_sign_in_ip,
          ip_location: self.current_location,
          sign_in_at: self.current_sign_in_at,
          sign_out_at: new_current,
          "#{self.class}".foreign_key.to_sym => self.id
        )
      end
    end
  end
end