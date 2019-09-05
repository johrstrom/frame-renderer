class AddEscapeHatches < ActiveRecord::Migration
  def change
    add_column :jobs, :job_attrs, :text, default: ''
    add_column :scripts, :script_attrs, :text, default: ''
  end
end