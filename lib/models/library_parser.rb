class LibraryParser

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def call
    Dir.foreach(self.url) do |item|
      puts item
    end
  end

end