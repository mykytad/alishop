class Cart
  def initialize(session)
    unless session.is_a?(Array)
      raise "session is not an array"
    end
    @product_ids = session
  end

  def add_product(product_id)
    @product_ids << product_id
  end

  def products
    Product.where({ :id => @product_ids })
  end

  def sum
    @sum = 0
    products.each do |product|
      @sum += product.price_with_discount * @product_ids.count(product.id.to_s)
    end
    @sum
  end

  def count(product_id)
    @product_ids.count(product_id)
  end

  def delete_product(product_id)
    position = @product_ids.index(product_id)
    @product_ids.delete_at(position)
  end

  def delete_all_product(product_id)
    @product_ids.delete(product_id)
  end

  def clear_product
    @product_ids = []
  end
end
