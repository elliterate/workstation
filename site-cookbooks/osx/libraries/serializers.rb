class SerializerRegistry
  class << self
    @@all = {}

    def register(type, serializer)
      @@all[type] = serializer
    end

    def find_by_type(type)
      @@all[type]
    end

    def find_by_value(value)
      @@all.each do |type, serializer|
        return serializer if value.is_a?(type)
      end
      nil
    end
  end
end

class DefaultSerializer
  def initialize(key, value)
    @key = key
    @value = value
  end

  def key
    @key
  end

  def type_flag
    raise NotImplementedError
  end

  def value
    raise NotImplementedError
  end

  def to_s
    "#{key} #{type_flag} #{value}"
  end
end

class IntSerializer < DefaultSerializer
  def type_flag
    '-int'
  end

  def value
    @value
  end
end

class FloatSerializer < DefaultSerializer
  def type_flag
    '-float'
  end

  def value
    @value.to_f
  end
end

class StringSerializer < DefaultSerializer
  def type_flag
    '-string'
  end

  def value
    Shellwords.escape(@value)
  end
end

class ArraySerializer < DefaultSerializer
  def type_flag
    '-array'
  end

  def value
    @value.map do |item|
      Shellwords.escape(item)
    end.join(' ')
  end
end

class BooleanSerializer < DefaultSerializer
  def type_flag
    '-boolean'
  end

  def value
    @value
  end
end

class DictSerializer < DefaultSerializer
  def type_flag
    '-dict'
  end

  def value
    @value.map do |key, value|
      klass = SerializerRegistry.find_by_value(value)
      serializer = klass.new(key, value)
      serializer.to_s
    end.join(' ')
  end
end

SerializerRegistry.register(Integer, IntSerializer)
SerializerRegistry.register(Float, FloatSerializer)
SerializerRegistry.register(String, StringSerializer)
SerializerRegistry.register(Array, ArraySerializer)
SerializerRegistry.register(Hash, DictSerializer)
SerializerRegistry.register(TrueClass, BooleanSerializer)
SerializerRegistry.register(FalseClass, BooleanSerializer)
