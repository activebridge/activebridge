# frozen_string_literal: true

module ExecutionHooks
  # this method is invoked whenever a new instance method is added to a class
  def method_added(method_name)
    # do nothing if the method that was added was an actual hook method, or
    # if it already had hooks added to it
    return if hooks.include?(method_name) || hooked_methods.include?(method_name)
    add_hooks_to(method_name)
  end

  # this is the DSL method that classes use to add before hooks
  def after_hook(method_name)
    hooks << method_name
  end

  # keeps track of all before hooks
  def hooks
    @hooks ||= []
  end

  private

  # keeps track of all currently hooked methods
  def hooked_methods
    @hooked_methods ||= []
  end

  def add_hooks_to(method_name)
    # add this method to known hook mappings to avoid infinite
    # recursion when we redefine the method below
    hooked_methods << method_name

    # grab the original method definition
    original_method = instance_method(method_name)

    # re-define the method, but notice how we reference the original
    # method definition
    define_method(method_name) do |*args, &block|
      # invoke the original method
      result = original_method.bind(self).call(*args, &block)

      # invoke the hook methods
      self.class.hooks.each do |hook|
        method(hook).call
      end

      result
    end
  end
end
