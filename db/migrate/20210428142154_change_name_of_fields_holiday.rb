class ChangeNameOfFieldsHoliday < ActiveRecord::Migration[5.2]
  def change
    rename_column :wl_national_holidays, :start, :start_date
    rename_column :wl_national_holidays, :end, :end_date
  end
end
