namespace :db do
  desc "Create categories"
  task create_categories: :environment do
    root = Category.create(name: "Root", parent: nil)
    root2 = root.subcategories.create(name: "Subcategory 1")
    root.subcategories.create(name: "Subcategory 2")
    root2.subcategories.create(name: "Root 2 Subcategory 1")
    root3 = root2.subcategories.create(name: "Root 2 Subcategory 2")
    root2.subcategories.create(name: "Root 2 Subcategory 3")
    root3.subcategories.create(name: "Root 3 Subcategory 1")
  end
end
