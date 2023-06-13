class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.not_found
    render json: { id: params[:id], message:'Not Found' }
  end
end
