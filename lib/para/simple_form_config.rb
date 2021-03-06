# Default simple form bootstrap initializer mechanism
module Para
  module SimpleFormConfig
    def self.wrapper_mappings
      {
        check_boxes: :para_vertical_radio_and_checkboxes,
        radio_buttons: :para_vertical_radio_and_checkboxes,
        boolean: :para_vertical_radio_and_checkboxes,
        datetime: :para_multi_select,
        date: :para_multi_select,
        time: :para_multi_select,
        file: :para_vertical_file_input
      }
    end

    def self.configure
      # Use this setup block to configure all options available in SimpleForm.
      SimpleForm.setup do |config|
        config.error_notification_class = 'alert alert-danger'
        config.button_class = 'btn'
        config.boolean_label_class = nil

        config.wrappers :para_vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
          b.use :html5
          b.use :placeholder
          b.optional :maxlength
          b.optional :minlength
          b.optional :pattern
          b.optional :min_max
          b.optional :readonly
          b.use :label, class: 'control-label'

          b.use :input, class: 'form-control'
          b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
          b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
        end

        config.wrappers :para_vertical_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
          b.use :html5
          b.use :placeholder
          b.optional :maxlength
          b.optional :minlength
          b.optional :readonly
          b.use :label, class: 'control-label'

          b.use :input
          b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
          b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
        end

        config.wrappers :para_vertical_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
          b.use :html5
          b.optional :readonly

          b.wrapper tag: 'div', class: 'checkbox' do |ba|
            ba.use :label_input
          end

          b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
          b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
        end

        config.wrappers :para_vertical_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
          b.use :html5
          b.optional :readonly
          b.use :label, class: 'control-label'
          b.use :input
          b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
          b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
        end

        config.wrappers :para_multi_select, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
          b.use :html5
          b.optional :readonly
          b.use :label, class: 'control-label'
          b.wrapper tag: 'div', class: 'form-inline' do |ba|
            ba.use :input, class: 'form-control'
            ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
            ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
          end
        end
      end
    end
  end
end
