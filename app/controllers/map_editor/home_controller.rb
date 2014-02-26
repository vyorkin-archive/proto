class MapEditor::HomeController < ApplicationController
  layout 'map_editor'
  before_action { @ng_app = 'map_editor' }

  def index
  end
end
