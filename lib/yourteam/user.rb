class YourTeam::User
  include DataMapper::Resource
  property :id, Serial
  # property :first, String
  # property :last, String
  property :username, String #twitter @username
  has 1, :team, :model => "YourTeam::Team"
  has n, :members, :through => :team
  
  # has_many :members, :through => :team
  
end