module Statistics
  def top_users(orders, quantity = 1)
    raise ArgumetsError unless quantity.is_a? Integer

    feed_top(orders, quantity, :user)
  end

  def top_drinks(orders, quantity = 1)
    raise ArgumetsError unless quantity.is_a? Integer

    feed_top(orders, quantity, :drink)
  end

  def favorite_drink_of_top_user(orders)
    user = top_users(orders, 1)

    orders.select { |order| user.include? order.user }
          .map(&:drink)
          .group_by(&:class)
          .max_by { |_klass, objects| objects.count }
          .first
  end

  private

  def feed_top(orders, quantity, object)
    orders.group_by(&object).sort_by { |_obj, grist| -grist.count }.first(quantity).to_h.keys
  end
end
