module Fluent
  class UnwindOutput < Fluent::Output
    Fluent::Plugin.register_output('unwind', self)
    config_param :output_tag, :string, default: nil
    config_param :unwind_key, :string, default: nil

    REQUIRED_PARAMS = %w(output_tag unwind_key)

    def configure(conf)
      super
      REQUIRED_PARAMS.each do |param|
        unless config.has_key?(param)
          raise Fluent::ConfigError, "#{param} field is required"
        end
      end
    end

    def emit(tag, es, chain)
      es.each do |time, record|
        chain.next
        if record[unwind_key] && record[unwind_key].is_a?(Array)
          record[unwind_key].each do |value|
            new_record = record.dup
            new_record[unwind_key] = value
            Fluent::Engine.emit(output_tag, time, new_record)
          end
        else
          Fluent::Engine.emit(output_tag, time, record)
        end
      end
    end
  end
end

