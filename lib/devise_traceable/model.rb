require 'devise_traceable/hooks/traceable'

module Devise
  module Models
    module Traceable
      def stamp!
        "#{self.class}Tracing".constantize.create(
          ip: self.current_sign_in_ip,
          ip_location: self.current_location,
          sign_in_at: self.current_sign_in_at,
          sign_out_at: self.Time.now,
          sign_out_ip: self.current_location.to_s,
          user_agent: self.user_agent.to_s,
          device_type: self.device_type.to_s,
          device_name: self.device_name.to_s,
          "#{self.class}".foreign_key.to_sym => self.id
        )
      end
    end
  end
end