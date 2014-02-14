class Demo
  # Remember to create a migration!

  def initialize(application)
    @service= application
  end

  def info
    @service.response.inspect
  end
end
