require "date"
require "rexml/document"

class GarminTcx

  LAP = 'TrainingCenterDatabase/Activities/Activity/Lap'

  def initialize xml
    @document ||= REXML::Document.new(xml)
  end

  def total_time
    total 'TotalTimeSeconds'
  end

  def total_distance # meters
    total 'DistanceMeters'
  end

  def max_speed # mps
    max 'MaximumSpeed'
  end

  def avg_speed # mps
    avg 'Extensions/ns3:LX/ns3:AvgSpeed'
  end

  def max_watt
    max 'MaximumWatt'
  end

  def avg_watt
    avg 'Extensions/ns3:LX/ns3:AvgWatt'
  end

  def max_cadence
    max 'Extensions/ns3:LX/ns3:MaxBikeCadence'
  end

  def avg_cadence
    avg 'Cadence'
  end

  def max_heart_rate
    max 'MaximumHeartRateBpm/Value'
  end

  def avg_heart_rate
    avg 'AverageHeartRateBpm/Value'
  end

  def each_trackpoints
    @document.elements.each("#{GarminTcx::LAP}/Track/Trackpoint") do |element|
      yield TrackPoint.new(element)
    end
  end

  private

  def avg nodename
    ar = []
    @document.elements.each("#{GarminTcx::LAP}/#{nodename}") {|v| ar << v.text.to_f }
    ar.empty? ? 0 : ( ar.inject{ |sum, el| sum + el }.to_f / ar.size )
  end

  def max nodename
    ar = []
    @document.elements.each("#{GarminTcx::LAP}/#{nodename}") {|v| ar << v.text.to_f }
    ar.empty? ? 0 : ar.max
  end

  def total nodename
    ret = 0
    @document.elements.each("#{GarminTcx::LAP}/#{nodename}") {|v| ret += v.text.to_f  }
    ret
  end

  class TrackPoint

    def initialize element
      @element = element
    end

    def time
      @time ||= DateTime.parse(@element.get_text('Time').value).strftime('%s').to_f
    end

    def latitude
      float_value 'Position/LatitudeDegrees'
    end

    def longitude
      float_value 'Position/LongitudeDegrees'
    end

    def distance_meters
      float_value 'DistanceMeters'
    end

    def altitude_meters
      float_value 'AltitudeMeters'
    end

    def speed
      float_value 'Extensions/ns3:TPX/ns3:Speed'
    end

    def watts
      float_value 'Extensions/ns3:TPX/ns3:Watts'
    end

    def heart_rate
      float_value 'HeartRateBpm/Value'
    end

    def cadence
      float_value('Cadence')
    end

    private
    def float_value nodename
      e = @element.get_text(nodename)
      e.nil? ? 0 : e.value.to_f
    end
  end

end