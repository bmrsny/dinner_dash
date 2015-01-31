class Seed
  def initialize
    build_items
    build_category
    build_orders
    build_users
    build_items_category
  end

  def build_orders
    order1 = Order.create(user_id: 1, status: "ordered", total: 2000)
    order1_item1 = OrdersItem.create(item_id: 1, order_id: 1, quantity: 2, subtotal: 2000)

    order2 = Order.create(user_id: 2, status: "ordered", total: 1500)
    order2_item1 = OrdersItem.create(item_id: 1, order_id: 2, quantity: 1, subtotal: 1000)
    order2_item6 = OrdersItem.create(item_id: 6, order_id: 2, quantity: 1, subtotal: 500)

    order3 = Order.create(user_id: 3, status: "completed", total: 1000)
    order3_item6 = OrdersItem.create(item_id: 6, order_id: 3, quantity: 2, subtotal: 1000)

    order4 = Order.create(user_id: 4, status: "completed", total: 3400)
    order4_item1 = OrdersItem.create(item_id: 1, order_id: 4, quantity: 1, subtotal: 1000)
    order4_item6 = OrdersItem.create(item_id: 6, order_id: 4, quantity: 2, subtotal: 1000)
    order4_item12 = OrdersItem.create(item_id: 12, order_id: 4, quantity: 2, subtotal: 1400)

    order5 = Order.create(user_id: 6, status: "paid", total: 1700)
    order5_item1 = OrdersItem.create(item_id: 11, order_id: 5, quantity: 1, subtotal: 500)
    order5_item1 = OrdersItem.create(item_id: 9, order_id: 5, quantity: 1, subtotal: 1200)

    order6 = Order.create(user_id: 7, status: "paid", total: 600)
    order6_item17 = OrdersItem.create(item_id: 17, order_id: 6, quantity: 2, subtotal: 600)

    order7 = Order.create(user_id: 8, status: "cancelled", total: 700)
    order7_item18 = OrdersItem.create(item_id: 18, order_id: 7, quantity: 1, subtotal: 300)
    order7_item19 = OrdersItem.create(item_id: 19, order_id: 7, quantity: 1, subtotal: 400)

    order8 = Order.create(user_id: 9, status: "cancelled", total: 1000)
    order8_item20 = OrdersItem.create(item_id: 20, order_id: 8, quantity: 2, subtotal: 1000)

    order9 = Order.create(user_id: 1, status: "completed", total: 2000)
    order9_item1 = OrdersItem.create(item_id: 1, order_id: 9, quantity: 2, subtotal: 2000)

    order10 = Order.create(user_id: 2, status: "completed", total: 1100)
    order10_item7 = OrdersItem.create(item_id: 7, order_id: 10, quantity: 2, subtotal: 1100)

  end

  def build_items
    item1 = Item.create(title: "Gut Buster", description: "If it's in the store, it's in this burrito!", price: 1000, image: open("app/assets/images/gut-buster.jpg"))
    item2 = Item.create(title: "Atomic Sunrise", description: "Spicy green chili, egg, and potato burrito.", price: 850, image: open("app/assets/images/bfast-burrito.png"))
    item3 = Item.create(title: "Fiesta Especial", description: "A 4-foot party-sized burrito to share with your family and friends.", price: 8000, image:open("app/assets/images/4_foot_burrito.jpg"))
    item4 = Item.create(title: "UF burritO", description: "Monthly special. It's out of this world.", price: 689, image: open("app/assets/images/AmericanBurrito.jpg"))
    item5 = Item.create(title: "Smothered Dynamite", description: "Classic pork green chili smothered burrito, your choice of fillings.", price: 899, image: open("app/assets/images/burrito-2.png"))
    item6 = Item.create(title: "Two Torpedo Tacos", description: "Two crispy chicken tacos.", price: 500, image: open("app/assets/images/tacos.jpg"))
    item7 = Item.create(title: "Queso Quesadillas", description: "These delicious veggie dillas can be frisbeed to your door upon request.", price: 550, image: open("app/assets/images/quesadilla.png"))
    item8 = Item.create(title: "Death by Burrito", description: "That's no moon, that's a Beef Burrito smoothered in spicy green chili sauce!", price: 750, image: open("app/assets/images/7_layer_burrito.png"))
    item9 = Item.create(title: "Flaming Fajitas", description: "These veggie fajitas will set your mouth on fire.", price: 1200, image: open("app/assets/images/beast.png"))
    item10 = Item.create(title: "Breakfast Quesadilla", description: "One delicious egg, cheese, and potato dilla.", price: 650, image: open("app/assets/images/bfast-burrito.png"))
    item11 = Item.create(title: "Halo", description: "All fresh vegetables which gives you the moring shine.", price: 500, image: open("app/assets/images/bfast-burrito.png"))
    item12 = Item.create(title: "Veggie delight", description: "Eat all your veggies, tomatoes, red onions, green peppers, mushrooms and more!", price: 700, image: open("app/assets/images/7_layer_burrito.png"))
    item13 = Item.create(title: "Not Too Sweet", description: "Just enough to satisfy your sweet tooth, all sweet things.", price: 500, image: open("app/assets/images/AmericanBurrito.jpg"))
    item14 = Item.create(title: "Classic", description: "Our classic burrito with authentic flavors.", price: 800, image: open("app/assets/images/burrito-2.png"))
    item15 = Item.create(title: "Hot 'n Spicy", description: "All the hot and spicy things you can handle.", price: 1000, image: open("app/assets/images/burrito_360.png"))
    item16 = Item.create(title: "Tamale Torpedo", description: "These little tamale bombs come in one flavor: spicy!", price: 400, image: open("app/assets/images/beast.png"))
    item17 = Item.create(title: "Rice and Bombs", description: "Our slow-simmered black beans and cilantro-lime rice packaged up in individual parachute packs.", price: 300, image: open("app/assets/images/beast.png"))
    item18 = Item.create(title: "Hot Sauce Bucket", description: "Just what it sounds like: a small bucket of our house hot sauce.", price: 300, image: open("app/assets/images/beast.png"))
    item19 = Item.create(title: "Chips and Salsa", description: "A bag of chips bubble-wrapped for special delivery with a small bucket of our house hot sauce.", price: 400, image: open("app/assets/images/chips_salsa.jpg"))
    item20 = Item.create(title: "Enola Empenada", description: "This empenada is filled with cheese and our famous mushroom salsa.", price: 500, image: open("app/assets/images/beast.png"))
  end

  def build_items_category
    test1 = ItemsCategory.create(item_id: 1, category_id: 3)
    test2 = ItemsCategory.create(item_id: 2, category_id: 2)
    test3 = ItemsCategory.create(item_id: 2, category_id: 3)
    test4 = ItemsCategory.create(item_id: 3, category_id: 3)
    test5 = ItemsCategory.create(item_id: 3, category_id: 2)
    test6 = ItemsCategory.create(item_id: 4, category_id: 3)
    test7 = ItemsCategory.create(item_id: 5, category_id: 3)
    test8 = ItemsCategory.create(item_id: 5, category_id: 2)
    test9 = ItemsCategory.create(item_id: 6, category_id: 3)
    test10 = ItemsCategory.create(item_id: 7, category_id: 3)
    test11 = ItemsCategory.create(item_id: 7, category_id: 1)
    test12 = ItemsCategory.create(item_id: 8, category_id: 3)
    test13 = ItemsCategory.create(item_id: 8, category_id: 2)
    test14 = ItemsCategory.create(item_id: 9, category_id: 2)
    test15 = ItemsCategory.create(item_id: 10, category_id: 1)
    test16 = ItemsCategory.create(item_id: 10, category_id: 4)
    test17 = ItemsCategory.create(item_id: 11, category_id: 1)
    test18 = ItemsCategory.create(item_id: 11, category_id: 4)
    test19 = ItemsCategory.create(item_id: 12, category_id: 1)
    test20 = ItemsCategory.create(item_id: 13, category_id: 3)
    test21 = ItemsCategory.create(item_id: 14, category_id: 2)
    test22 = ItemsCategory.create(item_id: 15, category_id: 2)
    test23 = ItemsCategory.create(item_id: 16, category_id: 5)
    test24 = ItemsCategory.create(item_id: 16, category_id: 2)
    test25 = ItemsCategory.create(item_id: 17, category_id: 5)
    test25 = ItemsCategory.create(item_id: 18, category_id: 5)
    test26 = ItemsCategory.create(item_id: 18, category_id: 2)
    test27 = ItemsCategory.create(item_id: 19, category_id: 5)
    test28 = ItemsCategory.create(item_id: 19, category_id: 2)
    test29 = ItemsCategory.create(item_id: 20, category_id: 5)
  end

  def build_category
    category1 = Category.create(name: "Vegetarian", description: "Meatless options.")
    category2 = Category.create(name: "Spicy", description: "Hot! Hot! Hot!")
    category3 = Category.create(name: "Specialty", description: "Chef's favorites.")
    category4 = Category.create(name: "Breakfast", description: "Start your day off right.")
    category5 = Category.create(name: "Sides", description: "A la carte options.")
  end


  def build_users
    user1 = User.create(fullname: "Johnny Bravo", email: "hooaa@gmail.com", display_name: "jbravo", password: "password", role: 0)
    user2 = User.create(fullname: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", role: 0)
    user3 = User.create(fullname: "Jeff Casmir", email: "demo+jeff@jumpstartlab.com", display_name: "j3", password: "password", role: 0)
    user4 = User.create(fullname: "Jeorge Tellez", email: "demo+jorge@jumpstartlab.com", display_name: "novohispano", password: "password", role: 0)
    user5 = User.create(fullname: "Josh Cheek", email: "demo+josh@jumpstartlab.com", display_name: "josh", password: "password", role: 1, image: "cheeky.jpg")
    user6 = User.create(fullname: "Steve Kinney", email: "demo+steve@jumpstartlab.com", display_name: "steveo", password: "password", role: 0)
    user7 = User.create(fullname: "Horace Williams", email: "demo+horace@jumpstartlab.com", display_name: "horace", password: "password", role: 0)
    user8 = User.create(fullname: "Raissa Shafer", email: "demo+raissa@jumpstartlab.com", password: "password", role: 0)
    user9 = User.create(fullname: "Josh Mejia", email: "demo+jmeija@jumpstartlab.com", display_name: "meija", password: "password", role: 0)
    user10 = User.create(fullname: "Joe Blow", email: "joe@gmail.com", display_name: "joe", password: "joe", role: 1, image: "joe_blow.jpg")
  end


end
Seed.new
