require 'test/unit'

$VERBOSE = true

require "#{File.dirname(File.dirname(__FILE__))}/lib/kernel/visibility_singleton_methods"

# Sample product code from rurema
# http://doc.ruby-lang.org/ja/2.6.0/method/Object/i/singleton_methods.html
Parent = Class.new

class <<Parent
  private;   def private_class_parent() end
  protected; def protected_class_parent() end
  public;    def public_class_parent() end
end

Foo = Class.new(Parent)

class <<Foo
  private;   def private_class_foo() end
  protected; def protected_class_foo() end
  public;    def public_class_foo() end
end

module Bar
  private;   def private_bar()   end
  protected; def protected_bar() end
  public;    def public_bar()    end
end

OBJ = Foo.new
class <<OBJ
  include Bar
  private;   def private_self()   end
  protected; def protected_self() end
  public;    def public_self()    end
end


class Test_Public_Singleton_methods < Test::Unit::TestCase

  def test_return_kind
    assert_instance_of Array, OBJ.public_singleton_methods
    assert(OBJ.public_singleton_methods.all?{|v|
      v.instance_of? Symbol
    })
  end

  def test_deal_param
    assert_equal OBJ.public_singleton_methods, OBJ.public_singleton_methods
  end

  def test_return_value
    assert OBJ.singleton_class.instance_of?(Class)
    assert_equal [:public_self], OBJ.public_singleton_methods
    assert_equal [:public_class_foo], Foo.public_singleton_methods
    pend('inheritance is not supported yet') { assert_equal [:public_self, :public_bar], OBJ.public_singleton_methods }
  end

end
