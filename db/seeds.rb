# rake db:seed

e = Employee.where(email: "admin@fastmenu.app").first_or_initialize
e.update(name: "Administrador", password: 123456, password_confirmation: 123456, kind: 1)
e = Employee.where(email: "attendant@fastmenu.app").first_or_initialize
e.update(name: "Atendente", password: 123456, password_confirmation: 123456, kind: 2)
e = Employee.where(email: "cook@fastmenu.app").first_or_initialize
e.update(name: "Cozinheiro", password: 123456, password_confirmation: 123456, kind: 3)

c = Category.where(title: "Bebidas").first_or_create
p = c.products.where(name: "Água Mineral").first_or_initialize
p.update(price: 5, preparation_time: 1)
p = c.products.where(name: "Coca-cola").first_or_initialize
p.update(price: 6, preparation_time: 1)
p = c.products.where(name: "Suco de Abacaxi ").first_or_initialize
p.update(description: "Suco feito da fruta, com hortelã colhido no dia", price: 8, preparation_time: 1)

c = Category.where(title: "Entradas/Petiscos").first_or_create
p = c.products.where(name: "Cesto de pães").first_or_initialize
p.update(description: "Cesto de pães variados",price: 19.9, preparation_time: 5)
p = c.products.where(name: "Bolinho de bacalhau").first_or_initialize
p.update(price: 35, preparation_time: 15)
p = c.products.where(name: "Carpaccio de cordeiro").first_or_initialize
p.update(price: 49, preparation_time: 15)
c = Category.where(title: "Pratos Principais").first_or_create
p = c.products.where(name: "Peixe a primavera").first_or_initialize
p.update(description: "Peixe assado coberto por delicado molho à base de leite desnatado, cenoura e abobrinha. Acompanha: arroz com ervas finas", price: 80, preparation_time: 35)
p = c.products.where(name: "Moqueca de Peixe").first_or_initialize
p.update(description: "Peixe assado coberto com saboroso molho de tomate e pimentão. Acompanha arroz integral e berinjela", price: 85, preparation_time: 35)
c = Category.where(title: "Sobremesas").first_or_create
p = c.products.where(name: "Pudim de Leite").first_or_initialize
p.update(price: 15, preparation_time: 1)
p = c.products.where(name: "Sorvete").first_or_initialize
p.update(price: 10, preparation_time: 1)

o = Employee.where(email: "attendant@fastmenu.app").first.orders.new(client_name: "Cliente Teste 01", table_number: 4, )
o.order_products.new(product_id: Product.all.sample.id, quantity: 3)
o.order_products.new(product_id: Product.all.sample.id, quantity: 1)
o.order_products.new(product_id: Product.all.sample.id, quantity: 2)
o.save

o = Employee.where(email: "attendant@fastmenu.app").first.orders.new(client_name: "Cliente Teste 02", table_number: 2, )
o.order_products.new(product_id: Product.all.sample.id, quantity: 1)
o.order_products.new(product_id: Product.all.sample.id, quantity: 1)
o.order_products.new(product_id: Product.all.sample.id, quantity: 2)
o.save

