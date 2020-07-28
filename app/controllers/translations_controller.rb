class TranslationsController < ApplicationController
  def translation_form
    require "google/cloud/translate"

    translate_client = Google::Cloud::Translate.new({ :version => :v2 })

    @language_list = translate_client.languages("en")

    render({ :template => "translation_templates/translation_form.html.erb" })
  end

  def translate
    text_to_translate = params.fetch("message_body")
    language_selection = params.fetch("language_selection")

    require "google/cloud/translate"

    translate_client   = Google::Cloud::Translate.new({ :version => :v2 })
    @translation = translate_client.translate(text_to_translate, :to => language_selection)

    cookies.store(:translation_body, text_to_translate)
    cookies.store(:translation_lang, language_selection)
    cookies.store(:translation_result, @translation)

    phone_number = params.fetch("telephone")

    if phone_number.length >= 11 # Otherwise we assume they didn't enter a number, or entered it incorrectly
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
