class Week < ActiveRecord::Base
  validates :subdomain, uniqueness: { case_sensitive: false }
  validates :name, uniqueness: { case_sensitive: false }

  after_create :create_tenant


  has_many :admins
  has_many :packages
  has_many :events
  has_many :users

  private
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
