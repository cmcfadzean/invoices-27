# frozen_string_literal: true

class NullComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end

end
