class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many   :comments, dependent: :destroy
  has_many   :relationships

  has_many   :tags, through: :relationships

  def self.search(search)
    if search
      search = search.downcase
      tag = Tag.find_by(label: search)
      if tag
        relationships = Relationship.where("tag_id = ?", tag.id)
        posts_ids = relationships.map { |x| x.post_id }
      end
      self.where("lower(title) LIKE :search OR id IN (:posts)", search: '%' + search + '%', posts: posts_ids)
    else
      self.all
    end
  end

  def str_tags=(string)
    puts string
    string = string.delete(' ').downcase
    tag_array = string.split(';')
    self.tags.clear
    self.save
    tag_array.each do |label|
      tag = Tag.find_by_label(label)
      if tag
        self.tags.push(tag)
      else
        self.tags.create(label: label)
      end
    end
  end

  def str_tags
    labels = ""
    self.tags.each do |tag|
      labels += tag.label + "; "
    end
    labels
  end
end
