#encoding: UTF-8
require 'awesome_print'
require 'pry'
require './match_setting.rb'
class Pair
  attr_accessor :male, :female
  def initialize(male, female)
    self.male = male
    self.female = female
  end

  def content
    [male, female]
  end

  def to_s
    male+female
  end
end
class Drawer
  attr_accessor :matched_groups, :previous_matched_groups, :current_pairs, :previous_paris, :cfg
    def initialize(setting)
        self.cfg = setting
        self.current_pairs = {}
        self.previous_paris = {}
        match_groups
    end

    def get_pair()
      male, female, pair = nil, nil, nil
      (1..99).each do
        male, female = @males.sample, @females.sample
        pair = Pair.new(male, female)
        break unless previous_paris.has_key?(pair.to_s)
      end
      @males.delete(male)
      @females.delete(female)
      return pair
    end

    def match_groups()
      init_match
      (0..self.cfg.groups-1).each do |i|
        matched_groups[i] ||= []
        (1..self.cfg.pairs_per_group).each do
          pair = get_pair
          current_pairs[pair.to_s] = i
          matched_groups[i] << pair.content
        end
      end
      remaining_attendees
      finish_match
      ap(matched_groups)
    end

    def remaining_attendees
      group_numbers = (0..self.cfg.groups-1).to_a.shuffle
      begin
        group_numbers*=2
      end  while group_numbers.count < (@females.count + @males.count)
      (@males.zip(@females)).each do |male, female|
        matched_groups[group_numbers.pop] << [male] if male
        matched_groups[group_numbers.pop] << [female] if female
      end
    end

    def finish_match
      self.previous_paris = current_pairs.dup
      self.previous_matched_groups = self.matched_groups.dup
    end

    private
    def init_match
      self.matched_groups = {}
      @males = self.cfg.attendees[:male].dup
      @females = self.cfg.attendees[:female].dup      
    end
end
m_val = MatchSetting.new(ARGV[0].to_i, ARGV[1])
d=Drawer.new(m_val)
