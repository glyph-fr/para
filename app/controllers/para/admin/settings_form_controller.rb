module Para
  module Admin
    class SettingsFormController < Para::Admin::BaseController
      load_and_authorize_component

      def update
        form = SettingsRails::Form.new
        form.settings_attributes = settings_params[:settings_attributes]
        form.save
        flash_message(:success, form)
        redirect_to admin_settings_path(@component)
      end

      private

      def settings_params
        params.require(:resource).permit(settings_attributes: [:key, :_type, :value])
      end
    end
  end
end