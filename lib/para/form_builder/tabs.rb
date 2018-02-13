module Para
  module FormBuilder
    module Tabs
      def tabs(options = {}, &block)
        manager = TabsManager.new(template, object, self, options)
        block.call(manager)

        template.render partial: 'para/form/tabs', locals: { tabs_manager: manager, tabs: manager.tabs }
      end

      class TabsManager
        attr_reader :template, :object, :builder, :options

        def initialize(template, object, builder, options)
          @template = template
          @object = object
          @builder = builder
          @options = options
        end

        def tab(identifier, options = {}, &block)
          tabs << Tab.new(template, object, builder, identifier, options, &block)
          nil
        end

        def tabs
          @tabs ||= []
        end

        def affix?
          options[:affix]
        end
      end

      class Tab
        attr_reader :template, :object, :builder, :identifier, :icon, :content

        delegate :capture, to: :template

        def initialize(template, object, builder, identifier, options, &content_block)
          @template = template
          @object = object
          @builder = builder
          @identifier = identifier
          @content = capture { content_block.call }
          @icon = options[:icon]
        end

        def title
          if Symbol === identifier
            ::I18n.t("forms.tabs.#{ object.class.model_name.i18n_key }.#{ identifier }")
          else
            identifier
          end
        end

        def dom_id
          @dom_id = [
            'form-tab',
            builder.nested_resource_dom_id.presence,
            identifier.to_s.parameterize
          ].compact.join('-')
        end
      end
    end
  end
end
