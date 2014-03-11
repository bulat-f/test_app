class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many   :comments, dependent: :destroy
  has_many   :relationships

  has_many   :tags, through: :relationships

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
