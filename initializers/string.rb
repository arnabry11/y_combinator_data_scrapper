class String
  def constantize
    names = self.split('::')
    names.shift if names.empty? || names.first.empty?

    names.inject(Object) do |constant, name|
      if constant.const_defined?(name)
        constant.const_get(name)
      else
        raise NameError, "uninitialized constant #{name}"
      end
    end
  end

  def classify
    self.split('/').collect do |c|
      c.split('_').collect(&:capitalize).join
    end.join('::')
  end
end
