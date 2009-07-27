class YourTeam::Member
  include DataMapper::Resource
  # has one user? i don't see how a member/photo could be assigned to more than one user. 
   has 1, :team, :model => "YourTeam::Team"
   has 1, :user, :through => :team
  property :id, Serial
  property :image_url, String
end