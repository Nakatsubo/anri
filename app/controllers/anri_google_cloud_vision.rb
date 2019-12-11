class AnriGoogleCloudVision
  require 'google/cloud/vision'
  require 'google/cloud/translate'

  attr_accessor :photo

  def initialize(photo)
    @photo = photo
  end

  def response
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new(
      version: :v1,
      credentials: Rails.application.credentials.google[:api_key]
    )
    file_name = @photo
    response = image_annotator.web_detection(image: file_name, max_results: 5)
    valLabels = []
    response.responses.each do |res|
      res.web_detection.web_entities.each do |label|
        valLabels << label.description
      end
    end

    translate = Google::Cloud::Translate.new(
      version: :v2,
      credentials: Rails.application.credentials.google[:api_key]
    )
    target_language = "ja"
    traLabels = []
    valLabels.each do |label|
      tra = translate.translate label, to: target_language
      traLabels << tra.text
    end

    keyLabel = ["label1", "label2", "label3", "label4", "label5"]
    aryLabel = [keyLabel, traLabels].transpose
    labels = Hash[*aryLabel.flatten]
    labels
  end
end
