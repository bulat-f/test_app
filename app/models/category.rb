class Category < ActiveRecord::Base
  has_many   :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"
  has_many   :posts

  def self.to_a
    result = Array.new
    self.all.each do |c|
      result.push([c.name, c.id])
    end
    result
  end

  def path
    result = Array.new
    c = self
    while c
      result.push(c)
      c = c.parent
    end
    result.reverse
  end
end
