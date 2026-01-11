# Compatibility shim for running this Jekyll site on Ruby 4+.
# Ruby 4 removed taint-related APIs, but older Liquid/Jekyll versions still call them.

if RUBY_VERSION.to_f >= 4.0
  class Object
    unless method_defined?(:tainted?)
      def tainted?
        false
      end

      def untrusted?
        false
      end

      def taint
        self
      end

      def untaint
        self
      end

      def trust
        self
      end

      def untrust
        self
      end
    end
  end
end
