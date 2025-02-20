class Book < ApplicationRecord


  has_one_attached :book_image

  
  def get_book_image
    unless book_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      book_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    book_image.variant(resize_to_limit: [100, 100]).processed
  end



end
