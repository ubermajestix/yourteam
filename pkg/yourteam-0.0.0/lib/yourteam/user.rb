class YourTeam::User
  include DataMapper::Resource
  property :id, Serial
  # property :first, String
  # property :last, String
  property :username, String #twitter @username
  has 1, :team, :model => "YourTeam::Team"
  has n, :members, :through => :team
  
  # has_many :members, :through => :team
  
  # def team
  #   self.members
  # end
  
  def add_member(opts={})
    raise "need to provide a user who's tagging" unless opts[:tagged_by]
    raise "need a member to add to this team" unless opts[:member]
    YourTeam::Team.create(:member=>opts[:member], :tagged_by=>opts[:tagged_by], :user=>self)
  end
end