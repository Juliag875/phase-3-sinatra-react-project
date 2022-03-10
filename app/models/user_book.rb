class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book 

  def self.books_plus_join_data
    self.all.where
    end 
  end 