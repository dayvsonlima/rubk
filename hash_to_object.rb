class Hash
  def to_object
    %x{
      var object,k;
      object = {};
      for (k in this.map) {
        object[k] = this.map[k][1];
      }
      return object;
    }
  end
end