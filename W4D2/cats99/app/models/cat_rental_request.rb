class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"]}
  after_initialize :status_pending
  validate approved_cat_requests_cannot_overlap
  
  belongs_to :cat
  
  def overlapping_requests
    #iterate through every request except ones where id = self.id
    #if start_date of request <= current end_date || end_date >= current
     # start_date, shovel to array of overlaps
     overlaps = []
     
     self.class.all.each do |request| 
       next if request.id == self.id
     
       if request.cat_id == self.cat_id
         if request.start_date <= self.end_date && request.end_date >= self.start_date
           overlaps << request
         end
       end 
     end
     
     overlaps
  end
  
  def overlapping_approved_requests
    overlapping_requests.select{ |request| request.status == "APPROVED" }
  end
  
  def approved_cat_requests_cannot_overlap
    unless overlapping_approved_requests.empty?
      errors[:request] << "can't overlap with other approved requests"
    end
  end
  
  protected
  
  def status_pending
    self.status ||= 'PENDING'
  end
  
end
