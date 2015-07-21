require File.expand_path("../test_helper", __FILE__)

describe Fastbill::Configuration do

  it "saves email and api key" do
    email = "test@test.com"
    api_key = "kjashd87hjdsh87huaiduh87hdhkasdjh87"

    Fastbill::Configuration.configure do |conf|
      conf.email = email
      conf.api_key = api_key
    end
    Fastbill::Configuration.email.must_equal email
    Fastbill::Configuration.api_key.must_equal api_key
  end

end
