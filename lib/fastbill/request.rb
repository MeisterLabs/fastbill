module Fastbill
  class Request
    class << self

      def post(body = "")
        #Result.process(connection.post(body: body))
        Result.process(connection.post("", body))
      end
      
      def post_multipart(body = "", file = nil, filename = "")
        
        tmp_file = Tempfile.new([filename + "-", ".pdf"]) # hochgeladene datei
        tmp_file.binmode
        tmp_file.write(open(file).read)

        payload = { :httpbody => body, :document => Faraday::UploadIO.new(tmp_file.path, 'application/pdf') }

        Result.process(connection_multipart.post("", payload))
      end
      
      private

        def auth_string
          ["#{Configuration.email}:#{Configuration.api_key}"].pack('m').delete("\r\n")
        end

        def header
          { "Content-Type" => "application/json", "Authorization" => "Basic #{auth_string}" }
        end
        
        def header_multipart
          { "Content-Type" => "multipart/form-data" , "Authorization" => "Basic #{auth_string}" }
        end

        def connection
          #Excon.new(Configuration.base_url, :headers => header)
          Faraday.new :url => Configuration.base_url, :headers => header
        end
        
        def connection_multipart
          
          conn = Faraday.new(:url => Configuration.base_url,:headers => header_multipart) do |f|
            #f.basic_auth("#{Configuration.email}", "#{Configuration.api_key}")
            f.request :multipart
            f.response :logger
            #f.request :url_encoded
            f.adapter :net_http # This is what ended up making it work
          end
          
          conn
        end
        
    end
  end
end
