class YourTeam::Member
  include DataMapper::Resource
  has 1, :team, :model => "YourTeam::Team"
  has 1, :user, :through => :team
  # has 1, :tagged_by, :model => "YourTeam::User", :through => :team, :child_key=>[:tagged_by_id]

  property :id, Serial
  property :image_url, String # from processed text
  property :name, String # from processed text
  property :text, String
  property :twitter_id, String
  property :created_at, DateTime, :default => Proc.new {Time.now}
  
  
  def tagged_by
    YourTeam::User.first(:id => self.team.tagged_by_id)
  end
end