# kernel-visibility_singleton_methods
#   - define Kernel#[visibility]_singleton_methods for improve API consistency
# Copyright (c) 2012 Kenichi Kamiya

module Kernel

  # @note
  # * Use (class << self; self; end) idiom for to get singleton classies.
  #   Because 1.8.7 dosen't have Kernel#singleton_class. 
  # * include_inherited option is not supported yet.
  #   Because it is too difficult in PureRuby :<

  # @return [Array<Symbol, String>] 1.8.7: Array<String>, 1.9~: Array<Symbol>
  def public_singleton_methods
    (class << self; self; end).public_instance_methods false
  end

  # @return [Array<Symbol, String>] 1.8.7: Array<String>, 1.9~: Array<Symbol>
  def protected_singleton_methods
    (class << self; self; end).protected_instance_methods false
  end

  # @return [Array<Symbol, String>] 1.8.7: Array<String>, 1.9~: Array<Symbol>
  def private_singleton_methods
    (class << self; self; end).private_instance_methods false
  end

end
