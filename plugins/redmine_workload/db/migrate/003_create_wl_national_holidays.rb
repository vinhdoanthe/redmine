class CreateWlNationalHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table  :wl_national_holidays do |t|
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.string    :reason,  :null => false
    end
  end
end
