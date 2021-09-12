# frozen_string_literal: true

class BrandingComponent < ViewComponent::Base
  def initialize(logo:)
    @logo = logo
  end 
end
