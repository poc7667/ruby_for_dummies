require 'awesome_print'
require 'pry'
require 'setting'

class Drawer
    def initialize(groups, im_file)
        @im_file = im_file
        @groups = groups
        @attendees={}
        @results=[]
        @current_pairs_to_group={}
        @last_pairs_to_group={}
        
        load_attendees
        info_step
        shuffle_groups
        ap(@results)
    end
    def info_step
      @numbers_in_group = ((@attendees[:male].count + @attendees[:female].count)/@groups)
      @pairs_in_group = @numbers_in_group.to_i/2
    end

    def load_attendees
        f=open(@im_file, 'r')
        f.each_line do |line|
          name, gender = line.split(',').map(&:strip)
          @attendees[gender.to_sym] ||= []
          @attendees[gender.to_sym] << name
        end
    end
    def shuffle_groups()
      init_shuffle
      (0..@groups-1).each do |i|
        @results[i] ||= []
        current_pairs = 0
        begin
          male, female = nil, nil
          begin            
            male = @males.sample
            female = @females.sample
          end while @last_pairs_to_group.has_key?(male+female)
          @current_pairs_to_group[male+female] = i
          @males.delete(male)
          @females.delete(female)
          @results[i] << [male, female]        
          current_pairs += 1
        end while current_pairs < @pairs_in_group
      end
      remaining_attendees
      @last_pairs_to_group = @current_pairs_to_group.dup
    end
    def remaining_attendees
      group_numbers = (0..@groups-1).to_a.shuffle
      (@males.zip(@females)).each do |male, female|
        @results[group_numbers.pop] << male if male
        @results[group_numbers.pop] << female if female
      end      
    end
    private
    def init_shuffle
      @results = {}
      @males = @attendees[:male].dup
      @females = @attendees[:female].dup      
    end
end

setting = Setting(ARGV[0].to_i, ARGV[1])

d=Drawer.new(setting)
