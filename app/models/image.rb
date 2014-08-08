# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  user_id                 :integer
#  created_at              :datetime
#  updated_at              :datetime
#  photo_file_name         :string(255)
#  photo_content_type      :string(255)
#  photo_file_size         :integer
#  photo_updated_at        :datetime
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#

class Image < ActiveRecord::Base
  has_attached_file :photo,  styles: { thumb: '100x100^',  medium: '250x250^' }, convert_options: { thumbnail: " -gravity center -crop '100x100+0+0'",  medium: " -gravity center -crop '250x250+0+0'" },  default_url: "/images/:style/missing.png" 

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  acts_as_votable
  acts_as_commentable

  validates_presence_of :name

  scope :todays, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  scope :trending, -> { where(created_at: Time.now.all_week).order(cached_votes_up: :desc) }
  scope :popular, -> { where(created_at: Time.now.all_week).order(cached_votes_up: :desc) }

  def self.search_image search_params
    if search
      where("name LIKE?",  "#{search_params}%")
    else
      find(:all)
    end
  end
end
