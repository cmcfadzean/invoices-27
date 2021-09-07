# frozen_string_literal: true

class ItemComponent < ViewComponent::Base
  renders_one :sub
  def initialize(title:, url:)
    @title = title
    @url = url
  end

end
