module Fastbill
  class Template < Fastbill::Model
    property :id, from: :TEMPLATE_ID
    fastbill_properties :template_name
  end
end
