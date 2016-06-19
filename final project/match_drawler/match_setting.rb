class MatchSetting
  attr_accessor :groups, :members_per_group, \
    :attendees, :pairs_per_group

  def initialize(groups, im_file)
    self.groups = groups
    load_attendees(im_file)
    self.members_per_group = (attendees[:male].count + attendees[:female].count)/groups
    self.pairs_per_group = self.members_per_group/2
  end

  def load_attendees(im_file)
    self.attendees={}
    open(im_file, 'r').each_line do |line|
      name, gender = line.split(',').map(&:strip)
      attendees[gender.to_sym] ||= []
      attendees[gender.to_sym] << name
    end
  end
end
