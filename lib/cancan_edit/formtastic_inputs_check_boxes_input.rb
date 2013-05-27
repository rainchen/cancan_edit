begin
  require 'formtastic/inputs/check_boxes_input'

  module Formtastic
    module Inputs
      class CheckBoxesInput

        # make sure check_boxes can work with cancan_edit
        def disabled_with_cancan_edit?(*args, &block)
          disabled_without_cancan_edit?(*args, &block) || !(@template.can_edit? method.to_sym, @object)
        end
        alias_method_chain :disabled?, :cancan_edit

      end
    end
  end

end
