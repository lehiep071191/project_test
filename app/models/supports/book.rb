class Supports::Book
  attr_reader :book, :books

  def initialize book
    @book = book
  end

  def books
    @books ||= book.all
  end

  def comment
    @comment = Comment.new
  end

  def comments_tree
    @comments = @book.comments
  end
end
