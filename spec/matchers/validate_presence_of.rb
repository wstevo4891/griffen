module Matchers
  class ValidatePresenceOf
  	def initialize(attribute)
  	  @attribute = attribute
  	end

  	def matches?(model)
  	  @model = model
  	  @model.valid?
  	  @model.errors.has_key(@attribute)
  	end

  	def failure_message
  	  "#{@model.class} failed to validate :#{@attribute} presence"
  	end

  	def negative_failure_message
  	  "#{@model.class} validated :#{@attribute} presence"
  	end
  end

  def validate_presence_of(attribute)
  	ValidatePresenceOf.new
  end
end
