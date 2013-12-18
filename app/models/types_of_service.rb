class TypesOfService < ActiveRecord::Base
	#	  validates_uniqueness_of :feature_name, :message => I18n.t(:name_exist_error), :if => :unique_for_program
	has_many :labors
	has_many :service_transactions

	validates_uniqueness_of :service_name

	def self.getname(id)
		service = TypesOfService.find_by_id(id) 
		unless service.blank?
			return service.service_name
		end
	end
end
