class TranslationsController < ApplicationController
  def translation_form
    require "google/cloud/translate"

    # Create an instance of the Google Translate Client
    gt_client = Google::Cloud::Translate.new({ :version => :v2 })

    # Retrieve a list of the available languages from the API to use for the form dropdown
    @language_list = gt_client.languages("en")

    render({ :template => "translation_templates/translation_form.html.erb" })
  end

  def translate
    text_to_translate = params.fetch("message_body")
    language_choice = params.fetch("language_selection")

    require "google/cloud/translate"

    # Create an instance of the Google Translate Client
    gt_client = Google::Cloud::Translate.new({ :version => :v2 })
    
    # Translate the text the user typed into the language they selected!
    @translation = gt_client.translate(text_to_translate, { :to => language_choice })

    phone_number = params.fetch(:telephone)

    if phone_number.length >= 11
      # Retrieve your credentials from secure storage
      twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
      twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
      twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

      # Create an instance of the Twilio Client and authenticate with your API key
      twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

      # Craft your SMS as a Hash with three keys
      sms_parameters = {
        :from => twilio_sending_number,
        :to => phone_number,
        :body => @translation
      }

      # Send your SMS!
      twilio_client.api.account.messages.create(sms_parameters)
    end

    render({ :template => "translation_templates/translate_results.html.erb" })
  end
end
