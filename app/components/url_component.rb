# frozen_string_literal: true

class UrlComponent < ViewComponent::Base
  def initialize(url:)
    @url = url
  end
end
