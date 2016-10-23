class Decorator
  @@decorator = []

  def self.decorator
    @@decorator
  end

  def self.delete
    @@decorator = []
  end
end
