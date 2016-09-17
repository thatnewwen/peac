class Profile < ApplicationRecord
	has_attached_file :resume,
										storage: :s3,
										s3_region: "us-east-1",
										
										s3_credentials: {access_key_id: ENV["AWS_KEY"], 
										secret_access_key: ENV["AWS_SECRET"]},
	                  bucket: "peac-resumes"

	validates :first_name, presence: true

	validates_attachment :resume, content_type: { content_type: "application/pdf"}
end
