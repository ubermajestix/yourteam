class YourTeam::Member
  include DataMapper::Resource
  # has one user? i don't see how a member/photo could be assigned to more than one user. 
   has 1, :team, :model => "YourTeam::Team"
   has 1, :user, :through => :team
   # has 1, :tagged_by, :model => "YourTeam::User", :through => :team, :child_key=>[:tagged_by_id]

  property :id, Serial
  property :image_url, String
  property :name, String
  
  def tagged_by
    YourTeam::User.first(:id => self.team.tagged_by_id)
  end
end