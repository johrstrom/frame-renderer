require 'securerandom'

class Submission < ActiveRecord::Base
  belongs_to :project
  has_many :jobs, dependent: :destroy

  attr_accessor :project_dir

  def submit
    new_job.submit(templated_content, job_opts)
  rescue => e
    errors.add(:name, :blank, message: e.inspect.to_s)
    puts 'error while submitting: ' + e.inspect.to_s
    false
  end

  def never_submitted_status
    'not submitted'
  end

  def start_frame
    frames.split('-').first
  end

  def end_frame
    frames.split('-').last
  end

  def latest_status
    status = jobs&.first&.status
    status.nil? ? Job.not_submitted_status : status
  end

  private

  def submission_template
    'jobs/video_jobs/maya_submit.sh.erb'
  end

  def new_job
    clstr = attributes['cluster']
    Job.create(
      submission_id: attributes['id'],
      cluster: clstr,
      job_id: SecureRandom.random_number(1000000).to_s + '.' + clstr + '-never.submitted',
      status: Job.not_submitted_status,
    )
  end

  def templated_content
    erb = ERB.new(File.read(submission_template))
    erb.filename = submission_template.to_s
    erb.result(binding)
  end

  def job_opts
    {
      job_name: 'maya-render',
      cores: attributes['cores'],
      email_on_terminated: attributes['email']
    }
  end
end