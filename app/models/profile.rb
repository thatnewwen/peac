class Profile < ApplicationRecord
	has_attached_file :resume

	validates :first_name, presence: true

	validates_attachment :resume, content_type: { content_type: "application/pdf"}
end
