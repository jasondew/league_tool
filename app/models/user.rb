require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles

  validates_presence_of     :email, :first_name, :last_name

  validates_format_of       :first_name, :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :first_name, :maximum => 100

  validates_format_of       :last_name, :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :last_name, :maximum => 100

  validates_length_of       :email, :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email, :with => Authentication.email_regex, :message => Authentication.bad_email_message

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  belongs_to :plan

  has_many :memberships
  has_many :leagues, :through => :memberships
  has_many :matches, :finder_sql => 'SELECT * FROM matches WHERE home_player_id = #{id} OR away_player_id = #{id}'

  def self.authenticate email, password
    return nil if email.blank? || password.blank?
    u = find_in_state :first, :active, :conditions => {:email => email} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def name
    [first_name, last_name].compact.join " "
  end

  def email= value
    write_attribute :email, (value ? value.downcase : nil)
  end

  def league_addable?
    puts "cur = #{leagues.size} limit = #{plan.league_limit}"
    leagues.size < plan.league_limit
  end

  protected
    
  def make_activation_code
    self.deleted_at = nil
    self.activation_code = self.class.make_token
  end

end
