class ChangeSubmissionToScript < ActiveRecord::Migration
  def change
    rename_table :submissions, :scripts

    change_table :jobs do |t|
      t.rename :submission_id, :script_id
    end
  end
end
