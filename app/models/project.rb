class Project < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  mount_uploader :image, ImageUploader
  validates :challenge,
            :solution,
            :logo,
            :technology,
            :duration,
            :team_size,
            :client,
            :industry,
            :link,
            :priority,
            presence: true
  validates :priority, uniqueness: true

  def project_length
    display_duration_in_words(duration)
  end

  def display_duration_in_words(number)
    number.to_i < 12 ? "#{number} months" : "#{(number.to_f / 12).round(1)} years"
  end
end
