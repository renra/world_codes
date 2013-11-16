class Array
  def rand
    self[Random.rand(self.length)]
  end
end
