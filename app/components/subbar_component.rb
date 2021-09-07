# frozen_string_literal: true

class SubbarComponent < ViewComponent::Base
  renders_one :action
  def initialize(heading:)
    @heading = heading
  end
end
