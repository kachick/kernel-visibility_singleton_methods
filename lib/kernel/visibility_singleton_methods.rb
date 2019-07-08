# kernel-visibility_singleton_methods
#   - define Kernel#[visibility]_singleton_methods for improve API consistency
# Copyright (c) 2012 Kenichi Kamiya

module Kernel

  # @note
  # * include_inherited option is not supported yet.
  #   Because it is too difficult in PureRuby :<

  # @return [Array<Symbol>]
  def public_singleton_methods
    singleton_class.public_instance_methods false
  end

  # @return [Array<Symbol>]
  def protected_singleton_methods
    singleton_class.protected_instance_methods false
  end

  # @return [Array<Symbol>]
  def private_singleton_methods
    singleton_class.private_instance_methods false
  end

end
