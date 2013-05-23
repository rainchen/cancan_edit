begin
  require 'formtastic/inputs/boolean_input'

  module Formtastic
    module Inputs
      class BooleanInput

        # make sure check_box_tag can work with cancan_edit
        def input_html_options_with_cancan_edit
          _html_options = input_html_options_without_cancan_edit
          _html_options.merge!({:disabled => true}) unless (@template.can_edit? method.to_sym, @object)
          _html_options
        end
        alias_method_chain :input_html_options, :cancan_edit

      end
    end
  end

end
