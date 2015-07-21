require File.expand_path("../test_helper", __FILE__)

describe Fastbill::Request do
  let(:email) { "test@test.com" }
  let(:api_key) { "kjashd87hjdsh87huaiduh87hdhkasdjh87" }
  let(:auth_string) { ["#{email}:#{api_key}"].pack("m").delete("\r\n") }
  let(:header) { { "Content-Type" => "application/json", "Authorization" => "Basic #{auth_string}" } }

  before do
    Fastbill::Configuration.configure do |conf|
      conf.email = email
      conf.api_key = api_key
    end
  end

  after do
    Excon.stubs.clear
  end

  describe "private" do
    it "#auth_string" do
      Fastbill::Request.send(:auth_string).must_equal auth_string
    end

    it "#header" do
      Fastbill::Request.send(:header).must_equal header
    end

    it "#connection" do
      excon_connection = Fastbill::Request.send(:connection)
      excon_connection.must_be_instance_of(Excon::Connection)
      excon_connection.connection[:headers].must_equal header
    end
  end

  describe "http methods" do
    describe "#post" do
      it "Status 200" do
        Excon.stub({:method => :post}, {:body => fixture_file("customers.json"), :status => 200})
        result = Fastbill::Request.post('{"SERVICE": "customer.get"}')
        result.must_equal JSON.parse(fixture_file("customers.json"))["RESPONSE"]
      end

      it "Error" do
        Excon.stub({:method => :post}, {:body => fixture_file("unauthorized_error.json"), :status => 401})
        -> { Fastbill::Request.post('{"SERVICE": "customer.get"}') }.must_raise(Fastbill::Error)
      end
    end
  end

end
