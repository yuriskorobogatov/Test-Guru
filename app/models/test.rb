class Test < ApplicationRecord

  def self.show_tests(category)
    @category = category  
    Test.where("category_id = ?", Category.where("title = ?", @category).ids[0]).pluck(:title).sort {|x,y| y <=> x }
  end

end
