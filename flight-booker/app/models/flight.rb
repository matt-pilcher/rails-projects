class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: 'Airport', foreign_key: :from_id
  belongs_to :to_airport, class_name: 'Airport', foreign_key: :to_id
  
  def self.list_all_airports
    Airport.pluck(:code, :id).sort.uniq
  end

  def self.list_all_flight_dates
    self.pluck(:date).map { |x| x.strftime('%d/%m/%Y') }.sort.uniq
  end


  def self.search(params)
    if params[:date].blank?
      self.none
    else
      self.where(from_id: params[:from], to_id: params[:to], date: params[:date])
    end
  end
end
