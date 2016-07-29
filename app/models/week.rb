class Week < ActiveRecord::Base
  validates :subdomain, uniqueness: { case_sensitive: false }
  validates :name, uniqueness: { case_sensitive: false }
  

  after_create :create_tenant

  private
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  has_and_belongs_to_many :admins
  has_many :packages
  has_many :events
end
