class Store < ActiveRecord::Base
  has_many :products, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :products
  ratyrate_rateable "overall"
  validates :name,:description,:contactId,:address,:zipcode,:tags,:city,:state,:country,presence: true



# http://stackoverflow.com/questions/5966910/generate-unique-random-string-with-letters-and-numbers-in-lower-case
	def generate_filename
    	@POSSIBLE = (('A'..'Z').to_a + (0..9).to_a)
    	self.filename = (0...10).map { |n| @POSSIBLE.sample }.join + '.jpg'
	  
	  if Store.find_by(filename: self.filename) != nil
	  	 generate_filename
	  end

	end
end
