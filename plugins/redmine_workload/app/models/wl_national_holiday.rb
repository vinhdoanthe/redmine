class WlNationalHoliday < ActiveRecord::Base
  unloadable

  validates :start_date, :date => true
  validates :end_date, :date => true
  validates_presence_of :start_date, :end_date, :reason
  validate :check_datum
  
  after_save :clearCache
  after_destroy :clearCache
  
  def check_datum
    if self.start && self.end && (start_changed? || end_changed?) && self.end < self.start 
       errors.add :end_date, :workload_end_before_start
    end 
  end
  
  private
  def clearCache
    Rails.cache.clear
  end
end
